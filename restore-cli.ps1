# Restore the dotnet CLI

$arch = $env:PROCESSOR_ARCHITECTURE -Replace 'AMD64', 'x64'
$dotnetCliUrl = "https://dotnetcli.blob.core.windows.net/dotnet/beta/Binaries/Latest/dotnet-combined-framework-sdk-host-win-$arch.latest.zip"
$binDir = "$PSScriptRoot/bin"
$zipFile = "$binDir/dotnet-$arch.zip"
$outputDirectory = "$binDir/dotnetcli"

# Download the zip file
echo "Downloading $zipFile..."
mkdir -f $binDir | Out-Null
$client = New-Object Net.WebClient
$client.DownloadFile($dotnetCliUrl, $zipFile)

# PowerShell lacks native support for zip files, so we have to use .NET APIs
echo "Extracting it to $outputDirectory..."
Add-Type -Assembly System.IO.Compression.FileSystem
[IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $outputDirectory)

# Done!
echo 'Done restoring dotnet CLI.'
