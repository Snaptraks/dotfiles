Set-PSReadLineOption –HistoryNoDuplicates:$True

Set-Alias grep findstr
Set-Alias ll ls
Set-Alias npp 'C:\Program Files\Notepad++\notepad++.exe'

function md5 { Get-FileHash $args -Algorithm MD5 }
function sha256 { Get-FileHash $args -Algorithm SHA256 }
function lastwake { powercfg -lastwake }
function ytdl { uvx --from yt-dlp[default] yt-dlp $args }

Function Get-DU {
    Param (
        $Path = "."
    )
    $AllFileInfo = @()
    ForEach ($File in (Get-ChildItem $Path)) {
        If ($File.PSisContainer) {
            $Size = [Math]::Round((Get-ChildItem $File.FullName -Recurse | Measure-Object -Property Length -Sum).Sum / 1KB, 2)
            $Folder = "True"
        }
        Else {
            $Size = $File.Length
            $Folder = ""
        }
        $FileInfo = New-Object System.Object
        $FileInfo | Add-Member -type NoteProperty -name Name -value $File.name
        $FileInfo | Add-Member -type NoteProperty -name Folder -value $Folder
        $FileInfo | Add-Member -type NoteProperty -name Size -value $Size
        $AllFileInfo += $FileInfo
    }
    $AllFileInfo
}
Set-Alias du Get-DU

oh-my-posh init pwsh --config "$env:USERPROFILE/snaptraks.omp.json" | Invoke-Expression


. "$env:USERPROFILE\Documents\PowerShell\Scripts\PyAutoEnv.ps1"

$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
