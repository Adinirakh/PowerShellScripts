Set-ExecutionPolicy Unrestricted
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
 
#################### Basic Utils ####################
choco install 7zip -y
# choco install dropbox -y
choco install nextcloud-client -y
choco install firefox -y
# choco install googlechrome -y
# choco install opera -y
# choco install brave -y
choco install filezilla -y
choco install bitvise-ssh-client -y
choco install keepassxc -y
choco install paint.net -y
choco install vlc -y
Choco install greenshot -y
choco install ffmpeg -y
choco install youtube-dl -y
choco install vscode -y

#################### Working Tools ##################
choco install powershell-core -y
# choco install fiddler -y
choco install nmap -y
choco install wireshark -y
choco install git -y
choco install github-desktop -y
# choco install tortoisesvn -y
choco install nuget.commandline -y
choco install rdmfree -y
# choco install sql-server-management-studio -y
# choco install sqlitebrowser -y
# choco install teamviewer -y
# choco install drawio -y
 
#################### Optional #######################

# choco install adobereader -y
# choco install bulkrenameutility -y
# choco install foobar2000 -y
# choco install mysql.workbench -y
# choco install imageresizerapp -y
# choco install microsoft-teams -y
# choco install notepadplusplus -x86 -y
# choco install signal -y
# choco install skype -y
# choco install xmind -y
# choco install atom -y
# choco install azurestorageexplorer -y
# choco install azure-data-studio -y
# choco install docker-desktop -y

# Pin packages that are automatically updated
$pin = "azure-data-studio", "brave", "drawio", "dropbox", "nextcloud-client", "expressvpn", "firefox", "googlechrome", "microsoft-teams", "opera", "paint.net", "signal", "skype", "spotify", "atom", "visualstudiocode"
$pin | ForEach-Object { choco pin add -n $_ }