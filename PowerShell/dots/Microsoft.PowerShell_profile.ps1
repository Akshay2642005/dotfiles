# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression


Import-Module -Name Terminal-Icons
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

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

# Alias
Set-Alias -Name neofetch -Value fastfetch
Set-Alias -Name gh -Value auto-git
Set-Alias -Name lg -Value lazygit
Set-Alias -Name vim -Value nvim
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

Set-Alias ytdlp 'C:\Users\M S I\Documents\PowerShell\Scripts\youtube-dl Easy Script.ps1'

Set-Alias lvim 'C:\Users\aksha\.local\bin\lvim.ps1'

Set-Alias lvim 'C:\Users\M S I\.local\bin\lvim.ps1'

Set-Alias -Name yz -Value yazi 

function coder {
    Start-Process -FilePath "C:\Users\M S I\AppData\Local\Programs\Ollama\Ollama.exe" -ArgumentList "run", "qwen2.5-coder:7b-instruct-q8_0" -NoNewWindow -Wait 
}

function gemma {
    Start-Process -FilePath "C:\Users\M S I\AppData\Local\Programs\Ollama\Ollama.exe" -ArgumentList "run", "gemma2:9b" -NoNewWindow -Wait 
}
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
function fx { nvim (fzf --preview "bat --style=numbers --color=always {1}") }
function fz { neovide (fzf --preview "bat --style=numbers --color=always {1}") }
function fs { fzf --preview "bat --style=numbers --color=always {1}"}
function ll {eza --icons=always --long --no-filesize --color=always --no-time --no-permissions --octal-permissions $args}
function ai { aider --model gemini/gemini-1.5-pro-latest}

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



