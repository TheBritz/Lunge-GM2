# Recolors the theme with specified colors. For help:
# $ python recolor.py -h
# Dependencies:
#   Python 3.5+
#   Make sure to `pip install image`

import os
import argparse
import glob
import math
import shutil

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
from recolor_const import *
from recolor_util import *
import json


###############################################################################
# Get theme colors, starting with a default preset and overriding user-provided colors/preset
###############################################################################
colors = {}     # current theme colors, to be filled with defaults

# Get available presets and load in a default to start from (requires a valid default to load)
presets_file = open('recolor_presets.json')
presets = json.load(presets_file)
preset_name = SPLASH_LABEL_DEFAULT
default_preset_name = SPLASH_LABEL_DEFAULT
preset_code_scheme = None

available_presets = list(presets.keys())
default_preset_key = DEFAULT_PRESET
if DEFAULT_PRESET not in available_presets:
    if len(available_presets) > 0:
        default_preset_key = available_presets[0]   # take the first preset as default if needed
    else:
        raise ValueError("No valid presets found in recolor_presets.json to use as default")
default_preset = presets[default_preset_key]
# Get default preset configurations
if SPLASH_LABEL_KEY in default_preset:
    preset_name = str(default_preset[SPLASH_LABEL_KEY])
    default_preset_name = preset_name
if CODE_KEY in default_preset:
    preset_code_scheme = str(default_preset[CODE_KEY])
for c in color_names:
    colors[c] = {
        DEFAULT_HEX: default_preset[c],
        DEFAULT_RGB: hex_to_rgb(default_preset[c]),
        UPDATED_RGB: hex_to_rgb(default_preset[c]),     # use default unless overridden below
        DESCRIPTION: color_names[c]
    }

# Specify valid arguments (all optional, defaults to initializing to original theme)
parser = argparse.ArgumentParser()
for name in color_names.keys():
    value = colors[name]
    parser.add_argument(name, nargs='?', default=None,
                        help=value[DESCRIPTION] + " in #RRGGBB format ('None' to skip)")
parser.add_argument('-f', '--force', action='store_true',
                    help='Force run outside of a GameMaker Studio 2 install folder')
parser.add_argument('-c', '--clean', action='store_true',
                    help='Clean update all files')
parser.add_argument('-d', '--default', action='store_true',
                    help='Override with default ' + default_preset_name + ' theme colors')
parser.add_argument('-p', '--preset', default=None,
                    help='Name of preset to use')
args = parser.parse_args()
color_args = vars(args)  # Get the command-line arguments as a dictionary
FORCE = args.force
CLEAN = args.clean
DEFAULT = args.default
PRESET = args.preset

# Apply colors from custom preset if possible
if PRESET is not None:
    # PRESET = str(PRESET).lower()                # make preset name lowercase to be case-insensitive
    # presets_str = presets_file.read().lower()   # make json lowercase to be case-insensitive
    # presets = json.loads(presets_str)

    # Terminate if the preset doesn't exist, rather than falling through
    if PRESET not in presets:
        raise ValueError("Preset '" + PRESET + "' not available.\nValid presets: " + str(list(presets.keys())))
    else:
        print("\nUSING PRESET \"" + PRESET + "\"")
        selected_preset = presets[PRESET]

        if SPLASH_LABEL_KEY in selected_preset:
            preset_name = str(selected_preset[SPLASH_LABEL_KEY])
        if CODE_KEY in selected_preset:
            preset_code_scheme = str(selected_preset[CODE_KEY])

        # Set all available colors from the preset
        for key in selected_preset:
            if key in colors:
                custom_color_rgb = hex_to_rgb(selected_preset[key])
                colors[key][UPDATED_RGB] = custom_color_rgb

# Get user parameters for new theme colors to apply on top of the loaded preset
for name in color_names:
    value = colors[name]
    if not DEFAULT and str(color_args[name]).lower() != "none":
        # override with the user-provided color
        arg_rgb = hex_to_rgb(color_args[name])
        value[UPDATED_RGB] = arg_rgb

# Display all overridden colors
print("\nDefault " + default_preset_name + " theme colors to replace:")
all_default = True
for name in colors:
    value = colors[name]
    if value[UPDATED_RGB] != value[DEFAULT_RGB]:
        all_default = False
        print("  " + value[DESCRIPTION] + ":")
        print("  \t" + value[DEFAULT_HEX].upper() + "\t -> \t" + rgb_to_hex(*value[UPDATED_RGB]).upper())

if all_default:
    print("  None. Using default " + default_preset_name + " theme.")

# Make sure the script is running under a GameMaker Studio 2 parent dir
if not FORCE and "GameMaker Studio 2" not in get_script_path():
    raise Exception("Not running from a GameMaker Studio 2 installation.")

# Check if we need to clean update (first run, missing generated, out-of-date, or new colors)
if not CLEAN:
    try:
        log = open(LAST_RUN, 'r')
        for line in log:
            if len(line.strip()) == 0:
                break

            tokens = line.split(':', 1)
            name = tokens[0]

            # If the colors we're updating to haven't been done before, we need to clean update
            last_update_rgb = hex_to_rgb(tokens[1].strip())
            new_update_rgb = colors[name][UPDATED_RGB]
            if new_update_rgb != last_update_rgb:
                CLEAN = True
                break
        log.close()
    except FileNotFoundError:
        CLEAN = True

###############################################################################
# Replace image colors with provided colors
###############################################################################
print("\nRecoloring theme images:")
images_updated = 0
for path in glob.iglob("**/*" + IMAGE_SUFFIX, recursive=True):
    new_path = path[:-len(IMAGE_SUFFIX)] + IMAGE_EXTENSION

    # Skip if this generated file is already up-to-date
    if is_file_up_to_date(path, new_path, CLEAN):
        continue

    im = Image.open(path)
    im = im.convert("RGBA")
    width, height = im.size
    pixels = im.load()
    modified = False

    for x in range(0, width):
        for y in range(0, height):
            pixel = pixels[x, y]
            pixel_rgb = pixel[:3]
            pixel_a = pixel[3]

            # Recolor matching any color on RGB only (inherit A from original)
            # Colors prioritized in order of definition
            for name in color_names:
                value = colors[name]
                old_rgb = value[DEFAULT_RGB]
                new_rgb = value[UPDATED_RGB]
                if pixel_rgb == old_rgb:
                    im.putpixel((x, y), new_rgb + (pixel_a,))
                    modified = True
                    break

    print("| " + new_path)
    if modified:
        print("|   UPDATED")
    im.save(new_path)
    images_updated += 1
if images_updated == 0:
    print("  All files already up-to-date")

###############################################################################
# Replace styling sheet colors with provided colors
# Source files stored in a subdirectory named STYLING_DIR
###############################################################################
print("\nRecoloring styling sheets:")
styles_updated = 0
replace_kv = ()
for key, value in colors.items():
    # Build a key-value set of strings to find and replace (can be in #AABBGGRR or #RRGGBB format)
    find_bgr = rgb_to_hex_bgr(*value[DEFAULT_RGB]).lstrip('#')  # only replace BBGGRR components, leave AA intact
    replace_bgr = rgb_to_hex_bgr(*value[UPDATED_RGB]).lstrip('#')
    find_rgb = rgb_to_hex(*value[DEFAULT_RGB])
    replace_rgb = rgb_to_hex(*value[UPDATED_RGB])
    replace_kv += ((find_bgr, replace_bgr), (find_rgb, replace_rgb))
replacer = multiple_replacer(*replace_kv)
for path in glob.iglob("**/" + STYLING_SRC_DIR + "/*" + STYLING_EXTENSION, recursive=True):
    filename = os.path.basename(path)
    new_dir = path[:-len(filename) - len(STYLING_SRC_DIR) - 1] + STYLING_DEST_DIR
    os.makedirs(new_dir, exist_ok=True)
    new_path = os.path.join(new_dir, filename)

    # Skip if this generated file is already up-to-date
    if is_file_up_to_date(path, new_path, CLEAN):
        continue

    src = open(path, 'r')
    dest = open(new_path, 'w+')  # Create the file if it doesn't exist
    for line in src:
        dest.write(replacer(line))

    print("| " + new_path)
    src.close()
    dest.close()
    styles_updated += 1
if styles_updated == 0:
    print("  All files already up-to-date")

###############################################################################
# Visual Studio icons are designed for a light theme and need to be inverted for a dark theme
###############################################################################
print("\nMatching Visual Studio icons to background color:")
icons_updated = 0
old_icon_background_color_hsv = rgba_to_hsv(*hex_to_rgb(OLD_ICON_BACKGROUND))
background_color_hsv = rgba_to_hsv(*colors['background'][UPDATED_RGB])
OLD_LUMINOSITY = old_icon_background_color_hsv[2]
NEW_LUMINOSITY = background_color_hsv[2]
for path in glob.iglob("**/*" + ICON_SUFFIX, recursive=True):
    new_path = path[:-len(ICON_SUFFIX)] + IMAGE_EXTENSION

    # Skip if this generated file is already up-to-date
    if is_file_up_to_date(path, new_path, CLEAN):
        continue

    im = Image.open(path)
    im = im.convert("RGBA")
    width, height = im.size
    pixels = im.load()
    modified = False

    for x in range(0, width):
        for y in range(0, height):
            old_pixel = pixels[x, y]
            pixel_hsv = rgba_to_hsv(*old_pixel)

            # Handle inverting the entire image to match the luminosity of the target background
            luminosity = pixel_hsv[2]
            old_luminosity = OLD_LUMINOSITY
            if NEW_LUMINOSITY < LUMINOSITY_INVERSION_THRESHOLD:
                old_luminosity = 1.0 - old_luminosity
                luminosity = 1.0 - luminosity

            if luminosity < old_luminosity:
                luminosity = NEW_LUMINOSITY * luminosity / old_luminosity
            else:
                luminosity = 1.0 - (1.0 - NEW_LUMINOSITY) * (1.0 - luminosity) / (1.0 - old_luminosity)

            # TODO: improve color adjustment
            # Approximate Visual Studio's inversion effect on hue and saturation
            hue = pixel_hsv[0]
            sat = pixel_hsv[1]
            val = luminosity
            if NEW_LUMINOSITY < LUMINOSITY_INVERSION_THRESHOLD:
                # Clamp inverted background color to the new luminosity
                if val < NEW_LUMINOSITY:
                    val = NEW_LUMINOSITY

                # Correlations from observing inversion:
                #   - less movement to 0/360 (whichever closest) by hue and saturation the closer hue is to 0/360
                #   - more decrease to hue and saturation the lower the original luminosity of the color
                #   - luminosity recovers in brightness at low hue
                #   - less change overall the lower the saturation
                # Distance of hue from center, scaled inversely by original luminosity, and attenuated by saturation
                dist = math.sin(hue * math.pi) * (1.0 - pixel_hsv[2]) * sat * \
                       ((OLD_LUMINOSITY - NEW_LUMINOSITY) / OLD_LUMINOSITY)
                hue = max(hue - dist * 0.1, 0.0)
                sat = max(sat - dist * 1.5, 0.0)
                val = min(val + (1.0 - dist) * sat, 1.0)

            new_pixel = hsv_to_rgba(hue, sat, val, old_pixel[3])
            im.putpixel((x, y), new_pixel)

    print("| " + new_path)
    im.save(new_path)
    icons_updated += 1
if icons_updated == 0:
    print("  All files already up-to-date")

###############################################################################
# Fix text cursor IBar (unlike Windows, the cursor is a static sprite)
# If container_background is dark, use the white cursor, otherwise use the black
###############################################################################
if os.path.exists(IBAR_PATH):
    print("\nManually set IBar cursor color:")
    container_color = colors["container_background"]
    container_color_hsv = rgba_to_hsv(*container_color[UPDATED_RGB])
    container_color_lum = container_color_hsv[2]
    cursor_to_use = IBAR_FOR_DARK
    if container_color_lum >= IBAR_INVERT_THRESHOLD:
        cursor_to_use = IBAR_FOR_LIGHT
        print("| Black cursor on light text fields")
    else:
        print("| White cursor on dark text fields")

    # Replace the cursor image
    os.remove(IBAR_PATH)
    shutil.copy(cursor_to_use, IBAR_PATH)

###############################################################################
# Create the splash image
###############################################################################
if os.path.exists(SPLASH_BACK) and os.path.exists(SPLASH_LOGO):
    print("\nGenerating splash image:")
    splash_bg = Image.open(SPLASH_BACK)

    splash_logo = Image.open(SPLASH_LOGO, 'r')
    splash_bg.paste(splash_logo, SPLASH_LOGO_OFFSET, mask=splash_logo)  # use mask on self for transparent logo back
    print("| Placed GMS logo")

    # Put the name of the theme on the splash
    splash_label = preset_name + " " + SPLASH_LABEL_SUFFIX
    draw = ImageDraw.Draw(splash_bg)
    font = ImageFont.truetype(SPLASH_LABEL_FONT, SPLASH_LABEL_FONT_SIZE)
    text_dimension = font.getsize(splash_label)
    text_offset = (SPLASH_LABEL_OFFSET[0] - text_dimension[0], SPLASH_LABEL_OFFSET[1] - text_dimension[1])
    #draw.fontmode = "1"     # render text aliased
    draw.text(text_offset, splash_label, fill=SPLASH_LABEL_COLOR, font=font)
    print("| Labeled with: '" + splash_label + "'")

    splash_bg.save(SPLASH_PATH)

###############################################################################
# Set the code color scheme, if provided
###############################################################################
if preset_code_scheme is not None and os.path.exists(preset_code_scheme) and os.path.exists(CODE_PATH):
    print("\nSetting color scheme (Reset to Default in Preferences to use):")
    os.remove(CODE_PATH)
    shutil.copy(preset_code_scheme, CODE_PATH)
    print("  Using " + preset_code_scheme)

###############################################################################
# Save custom theme details to a file to reference on future use
###############################################################################
log = open(LAST_RUN, mode='w+')
for name in color_names:
    value = colors[name]
    specified_color = value[UPDATED_RGB]
    log.write(name + ":" + rgb_to_hex(*specified_color).lower() + "\n")
log.close()

print("\nDone!")
