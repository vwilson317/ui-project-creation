 param (
    [string]$name = "ui")

replace-in-file '{placeholder}' $name '*',"**/*" --ignore="token-replace.ps1" --verbose 