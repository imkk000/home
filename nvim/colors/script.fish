#!/usr/bin/env fish

for kind in "" "Floating" "Sign" "Underline" "VirtualLines" "VirtualText";
    for level in "Error" "Warning" "Hint" "Info" "Ok"
        string join '' -- 'highlight("' "Diagnostic$kind$level" '", { fg = colors.diagnostic_' (string lower $level) ' })'
    end
end

echo 'highlight("DiagnosticDeprecated", { fg = colors.diagnostic_deprecated })'
echo 'highlight("DiagnosticUnnecessary", { fg = colors.diagnostic_unnecessary })'
