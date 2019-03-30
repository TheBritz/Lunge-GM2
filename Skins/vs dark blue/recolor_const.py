# Original RGB color values
DEFAULT_PRESET = "green"                # Stored in recolor_presets.json
color_names = {"accent":                    "Primary theme color",
               "accent_contrast":           "Alternate high-contrast theme color",
               "background":                "Main background color (grayscale)",
               "border":                    "Border color around panels, containers, toolbars, etc.",
               "container_background":      "Container backgrounds contrasted against main background color",
               "workspace_background":      "Workspace and editor canvas background color",
               "label":                     "Label/text color",
               "label_deactivated":         "Deactivated label/text color",
               "button_mousedown":          "Depressed button and high-contrast elements color",
               "selected":                  "Selected list elements color",
               "link":                      "Hyperlink color",
               "link_mouseover":            "Hyperlink mouseover color",
               "text_selected":             "Selected text background color",
               "error":                     "Error highlight color (typically red)",
               "notice":                    "Occasionally-used accent color to draw notice (e.g. for progress bars)",
               "scrollbar_track":           "Scrollbar track color",
               "scrollbar_thumb":           "Scrollbar thumb color",
               "scrollbar_thumb_hover":     "Scrollbar thumb mouseover color",
               "scrollbar_thumb_active":    "Scrollbar thumb mousedown color",
               "code_background":           "Code/text editor background color"}
OLD_ICON_BACKGROUND = "#f1f0f1"     # VS Light Theme Background

LUMINOSITY_INVERSION_THRESHOLD = 0.5

IMAGE_EXTENSION = ".png"
STYLING_EXTENSION = ".json"
IMAGE_SUFFIX = "_vsdarkorig" + IMAGE_EXTENSION
STYLING_SRC_DIR = "Styles_vsdarkorig"
STYLING_DEST_DIR = "Styles"
STYLING_SUFFIX = "_vsdarkorig" + STYLING_EXTENSION
ICON_SUFFIX = "_vsdarkiconorig" + IMAGE_EXTENSION
# Replace the IBar cursor
# Assume the Cursors folder is in the same directory
IBAR_PATH = "Cursors/IBar_3_8" + IMAGE_EXTENSION
IBAR_INVERT_THRESHOLD = 0.4
IBAR_FOR_LIGHT = "Cursors/IBarBlack_3_8" + IMAGE_EXTENSION
IBAR_FOR_DARK = "Cursors/IBarWhite_3_8" + IMAGE_EXTENSION
# Replace the splash
# Assume the Images folder is in the same directory
SPLASH_PATH = "Images/splash_background" + IMAGE_EXTENSION
SPLASH_BACK = "Images/splash_background_bg" + IMAGE_EXTENSION
SPLASH_LOGO = "Images/splash_background_logo" + IMAGE_EXTENSION
SPLASH_LOGO_OFFSET = (96, 28)
SPLASH_LABEL_KEY = "name"
SPLASH_LABEL_SUFFIX = "(VS2015 Theme 2.1, by iluvfuz)"      # description suffix
SPLASH_LABEL_DEFAULT = "VS2015 Theme"                       # default theme name
SPLASH_LABEL_OFFSET = (645, 397)
SPLASH_LABEL_FONT = "OpenSans-Regular.ttf"
SPLASH_LABEL_FONT_SIZE = 12
SPLASH_LABEL_COLOR = "#7f867f"
# Replace the code color scheme
# Assume the Styles folder is in the same directory
CODE_KEY = "code_scheme"
CODE_PATH = "Styles/styles_code_editor.json"

# Script flags (can be set by command line)
FORCE = False       # force running even if not in proper directory
CLEAN = False       # clean update all possible files (otherwise only updates files that don't exist or are out-of-date)
DEFAULT = False     # use original colors (for initializing)

DEFAULT_HEX = "default_hex"
DEFAULT_RGB = "default"
UPDATED_RGB = "updated"
DESCRIPTION = "description"

LAST_RUN = "theme.txt"
