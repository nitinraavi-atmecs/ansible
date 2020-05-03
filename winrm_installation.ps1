$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -EnableCredSSP -DisableBasicAuth
Get-childItem -Path WSMan:\localhost\Listener | Where-Object { $_.Keys -eq "Transport=HTTP"} | Remove-Item -Recurse -Force
winrm enumerate winrm/config/Listener
winrm get winrm/config/service
