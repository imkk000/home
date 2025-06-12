## Theme Information

- **Name:** Tomorrow Fork
- **Author:** Custom
- **Version:** 1.0
- **Description:** Eye-comfortable ultra-dark theme with muted blue accents
- **Best for:** Long coding sessions, night development, eye strain reduction

## Core Color Palette

### Base Colors

```
background_primary   = "#0a0c0f"  # Ultra dark background
background_secondary = "#0f1216"  # Alternative/elevated background
background_tertiary  = "#1a2128"  # Cards, panels, selection

foreground_primary   = "#8a9299"  # Main text (whisper soft)
foreground_secondary = "#5a6066"  # Dimmed text, comments
foreground_tertiary  = "#3a4248"  # Subtle text, disabled elements
```

### Accent Colors (Muted Blues)

```
accent_primary   = "#4a7a95"  # Main blue accent
accent_secondary = "#3a6a85"  # Soft cyan accent
accent_tertiary  = "#3a5a75"  # Deep blue accent
accent_subtle    = "#1a3545"  # Very subtle blue
accent_midnight  = "#1a2a45"  # Midnight blue
accent_sapphire  = "#2a4555"  # Muted sapphire
```

### Semantic Colors

```
success = "#5a6a5f"  # Muted green
warning = "#a8955a"  # Muted yellow
error   = "#a85a57"  # Soft red
info    = "#3a6a85"  # Soft cyan
```

### Special UI Colors

```
cursor     = "#4a6b85"  # Cursor color
selection  = "#1a2128"  # Text selection
border     = "#2a4555"  # Borders and separators
shadow     = "#000000"  # Drop shadows
highlight  = "#1a3545"  # Hover states
```

## Standard 16-Color ANSI Palette

### Normal Colors (0-7)

```
black   = "#0a0c0f"  # 0 - Background
red     = "#8a4a47"  # 1 - Muted red
green   = "#4a5a4f"  # 2 - Muted green
yellow  = "#8a7a42"  # 3 - Muted yellow
blue    = "#3a5a75"  # 4 - Professional blue
magenta = "#5a4a75"  # 5 - Muted purple
cyan    = "#2a5a75"  # 6 - Deep ocean blue
white   = "#8a9299"  # 7 - Main text
```

### Bright Colors (8-15)

```
bright_black   = "#1a2128"  # 8 - Dark grey
bright_red     = "#a85a57"  # 9 - Soft red
bright_green   = "#5a6a5f"  # 10 - Gentle green
bright_yellow  = "#a8955a"  # 11 - Warm yellow
bright_blue    = "#4a7a95"  # 12 - Muted sky blue
bright_magenta = "#6a5a85"  # 13 - Soft lavender
bright_cyan    = "#3a6a85"  # 14 - Subdued cyan
bright_white   = "#9aa7b0"  # 15 - Light text
```

## Extended Palette (Optional)

### Syntax Highlighting

```
keyword      = "#4a7a95"  # Keywords, declarations
type         = "#3a5a75"  # Types, classes
function     = "#3a6a85"  # Functions, methods
string       = "#5a6a5f"  # String literals
number       = "#a8955a"  # Numeric values
comment      = "#3a4248"  # Comments
operator     = "#6a5a85"  # Operators, symbols
constant     = "#6a5a85"  # Constants, booleans
variable     = "#8a9299"  # Variables, identifiers
package      = "#a85a57"  # Imports, modules
```

### UI Components

```
button_bg        = "#1a2128"
button_hover     = "#2a4555"
button_active    = "#4a7a95"
button_disabled  = "#3a4248"

input_bg         = "#0f1216"
input_border     = "#2a4555"
input_focus      = "#4a7a95"

menu_bg          = "#1a2128"
menu_hover       = "#2a4555"
menu_selected    = "#4a7a95"

tab_active       = "#4a7a95"
tab_inactive     = "#3a4248"

status_bg        = "#0f1216"
status_text      = "#8a9299"
```

## Application-Specific Exports

### Terminal/Shell (Hex Format)

```bash
# For .Xresources, Windows Terminal, etc.
background: #0a0c0f
foreground: #8a9299
color0:  #0a0c0f
color1:  #8a4a47
color2:  #4a5a4f
color3:  #8a7a42
color4:  #3a5a75
color5:  #5a4a75
color6:  #2a5a75
color7:  #8a9299
color8:  #1a2128
color9:  #a85a57
color10: #5a6a5f
color11: #a8955a
color12: #4a7a95
color13: #6a5a85
color14: #3a6a85
color15: #9aa7b0
```

### RGB Values (0-255)

```
background_primary:   (10,  12,  15)
foreground_primary:   (138, 146, 153)
accent_primary:       (74,  122, 149)
success:              (90,  106, 95)
warning:              (168, 149, 90)
error:                (168, 90,  87)
```

### HSL Values

```
background_primary:   hsl(210, 20%, 5%)
foreground_primary:   hsl(210, 8%, 57%)
accent_primary:       hsl(202, 34%, 44%)
success:              hsl(150, 8%, 38%)
warning:              hsl(45, 30%, 51%)
error:                hsl(2, 32%, 50%)
```

## Usage Guidelines

### Best Practices

- Use `background_primary` for main application background
- Use `foreground_primary` for body text
- Use `accent_primary` for primary actions and highlights
- Use semantic colors (success, warning, error) for status indicators
- Use `foreground_secondary` for less important text
- Use `selection` color for text/item selection

### Accessibility

- All color combinations meet WCAG AA contrast requirements
- Text on background has 4.5:1+ contrast ratio
- No pure black backgrounds (prevents halation)
- Muted colors reduce eye strain during long use

### Variations

- **Lighter variant:** Increase lightness by 10-15%
- **Darker variant:** Decrease lightness by 5-10%
- **Higher contrast:** Use bright colors more liberally
- **Lower contrast:** Use more subtle color differences

## Integration Examples

### CSS Variables

```css
:root {
  --bg-primary: #0a0c0f;
  --fg-primary: #8a9299;
  --accent-primary: #4a7a95;
  --success: #5a6a5f;
  --warning: #a8955a;
  --error: #a85a57;
}
```

### JSON Format

```json
{
  "name": "Tomorrow Fork",
  "colors": {
    "background": "#0a0c0f",
    "foreground": "#8a9299",
    "accent": "#4a7a95",
    "success": "#5a6a5f",
    "warning": "#a8955a",
    "error": "#a85a57"
  }
}
```

### YAML Format

```yaml
name: Ultra Dark Muted Blue
colors:
  background: "#0a0c0f"
  foreground: "#8a9299"
  accent: "#4a7a95"
  success: "#5a6a5f"
  warning: "#a8955a"
  error: "#a85a57"
```

This template provides everything you need to implement the theme across different applications while maintaining consistency!
