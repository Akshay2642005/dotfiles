# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot "./akshay.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

# PSReadLine
#Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -Colors @{
    Type = "DarkCyan"
    Member = "Gray"
    String = "DarkGray"
    Number = "Yellow"
    Comment = "DarkGreen"
    Command = "Cyan"
    Keyword = "Cyan"
    Operator = "Gray"
    Variable = "Magenta"
    Parameter = "Gray"
}
# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
$env:desktop = "C:\Users\M S I\OneDrive\Desktop"
$ENV:SSH_AUTH_SOCK = $null
$env:EDITOR = "nvim"
$env:FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --border"
$env:KUBECONFIG = "$env:USERPROFILE\.kube\config"
$env:SSH_KNOWN_HOSTS="C:\Users\M S I\.ssh\known_hosts"
# Alias
Set-Alias -Name neofetch -Value fastfetch
Set-Alias -Name agt -Value auto-git
Set-Alias -Name lg -Value lazygit
Set-Alias -Name lds -Value lazydocker
Set-Alias -Name vim -Value nvim
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias k kubectl
Set-Alias mk minikube
Set-Alias vbox vboxmanage
Set-Alias tf terraform
Set-Alias bp boilerplates

# Utilities
function pods {
    podman machine start
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


Set-Alias -Name yz -Value yazi 


Import-Module -Name Microsoft.WinGet.CommandNotFound

function v {
    $file = fzf --height 100% `
        --reverse `
        --border sharp `
        --margin=0,0 `
        --padding=0 `
        --preview 'bat --style=plain --color=always --theme="base16" --line-range :500 {}' `
        --preview-window 'right:55%:wrap' `
        --color "fg:#808080,bg:#000000,hl:#a8a8a8,fg+:#c0c0c0,bg+:#1a1a1a,hl+:#d0d0d0,info:#606060,prompt:#909090,pointer:#b0b0b0,marker:#a0a0a0,spinner:#707070,border:#2a2a2a" `
        --prompt "☠  > " `
        --pointer "⚔" `
        --marker "✝" `
        --bind "ctrl-d:toggle-preview,ctrl-p:toggle-sort,ctrl-u:half-page-up,ctrl-n:half-page-down,ctrl-r:reload(rg --files --hidden --glob '!.git/*')" `
        --layout reverse `
        --ansi `
        --border none `
        --info inline
    if ($file) {
        nvim $file
    }
}

function fz { neovide (fzf --preview "bat --style=numbers --color=always {1}") }
function fs { fzf --preview "bat --style=numbers --color=always {1}"}
function ll {eza --icons=always --long --no-filesize --color=always --no-time --no-permissions --octal-permissions $args}

function ff {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

function love {
       param (
           [Parameter(Position = 0)]
           [string]$filename = "."
       )
       & "C:\Program Files\LOVE\love.exe" $filename
}

function mkdir {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FolderName
    )
    try {
        # Resolve the full path to avoid confusion
        $fullPath = Resolve-Path -Path $FolderName -ErrorAction SilentlyContinue
        if (-not $fullPath) {
            # Create the directory if it doesn't exist
            $fullPath = New-Item -ItemType Directory -Path $FolderName -ErrorAction Stop | Select-Object -ExpandProperty FullName
        }

        # Change into the directory
        Set-Location -Path $fullPath
        # Confirm the operation
        Write-Output "Successfully created and entered the directory: $(Get-Location)"
    } catch {
        # Handle errors
        Write-Output "Error: $($_.Exception.Message)"
    }
}
function fzf-grep {
    rg --files | fzf --preview 'rg --color=always --pretty {}'
}
Set-Alias fg fzf-grep

function shrm {
    rm "C:\Users\M S I\AppData\Local\nvim-data\shada\main.shada.tmp.X"
}

flux completion powershell | Out-String | Invoke-Expression
k3d completion powershell | Out-String | Invoke-Expression
kubectl completion powershell | Out-String | Invoke-Expression



Import-Module PSReadLine
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    $Env:_BOILERPLATES_COMPLETE = "complete_powershell"
    $Env:_TYPER_COMPLETE_ARGS = $commandAst.ToString()
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = $wordToComplete
    boilerplates | ForEach-Object {
        $commandArray = $_ -Split ":::"
        $command = $commandArray[0]
        $helpString = $commandArray[1]
        [System.Management.Automation.CompletionResult]::new(
            $command, $command, 'ParameterValue', $helpString)
    }
    $Env:_BOILERPLATES_COMPLETE = ""
    $Env:_TYPER_COMPLETE_ARGS = ""
    $Env:_TYPER_COMPLETE_WORD_TO_COMPLETE = ""
}
Register-ArgumentCompleter -Native -CommandName boilerplates -ScriptBlock $scriptblock
