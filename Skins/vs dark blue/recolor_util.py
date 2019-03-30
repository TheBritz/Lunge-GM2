import colorsys
import os
import sys
import re


def get_script_path():
    return os.path.dirname(os.path.realpath(sys.argv[0]))


# Convert #RRGGBB to (R, G, B) [0, 255]
def hex_to_rgb(value):
    # Ensure the hex string is 6 characters long
    value = value.lstrip('#')
    lv = len(value)
    if lv != 6:
        raise ValueError("RGB value must be in the form of #RRGGBB")
    return tuple(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))


# Convert (R, G, B) [0, 255] to #RRGGBB
def rgb_to_hex(red, green, blue):
    return '#%02x%02x%02x' % (red, green, blue)


# Convert (R, G, B) [0, 255] to #AABBGGRR
def rgb_to_hex_bgr(red, green, blue):
    return '#%02x%02x%02x' % (blue, green, red)


# Convert (R, G, B, A) [0, 255] to (H, S, V) [0, 1]
def rgba_to_hsv(red, green, blue, alpha=0):
    return colorsys.rgb_to_hsv(red / 255, green / 255, blue / 255)


# Convert (H, S, V) [0, 1] to (R, G, B, A) [0, 255]
def hsv_to_rgba(hue, sat, val, alpha):
    return tuple(int(round(255 * f)) for f in colorsys.hsv_to_rgb(hue, sat, val)) + (alpha,)


# Returns true if there is already a file at the destination that is updated past the source file
def is_file_up_to_date(src_path, dest_path, clean):
    if not os.path.exists(src_path):
        raise ValueError("Source file doesn't exist")
    if clean:
        return False
    if not os.path.exists(dest_path):
        return False

    src_modified = os.path.getmtime(src_path)
    dest_modified = os.path.getmtime(dest_path)
    if dest_modified > src_modified:
        return True
    return False


# Returns a function for replacing multiple possibles substrings
# http://stackoverflow.com/a/23761152
def multiple_replacer(*key_values):
    replace_dict = dict(key_values)
    replacement_function = lambda match: replace_dict[match.group(0)]
    pattern = re.compile("|".join([re.escape(k) for k, v in key_values]), re.M)
    return lambda string: pattern.sub(replacement_function, string)


def multiple_replace(string, *key_values):
    return multiple_replacer(*key_values)(string)
