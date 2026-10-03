try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}


# Oh My Posh
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "C:/Users/%USERNAME%/.config/ohmyposh/hul10.omp.json" | Invoke-Expression
}


# Fastfetch
function Show-Fastfetch {
    if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
        fastfetch -c "C:/Users/%USERNAME%/.config/fastfetch/config.jsonc"
    }
}


# Startup
Clear-Host
Show-Fastfetch


# Make "clear" and "cls" also run Fastfetch
function Clear-MyTerminal {
    Clear-Host
    Show-Fastfetch
}

Set-Item -Path Alias:clear -Value Clear-MyTerminal -Options AllScope -Force
Set-Item -Path Alias:cls -Value Clear-MyTerminal -Options AllScope -Force
