$JDK11 = "C:\progra~1\Eclipse Adoptium\jdk-11.0.16.101-hotspot"
$env:JAVA_HOME = $JDK11

# https://github.com/facebook/react-native/issues/35210
# for this reason, we need upgrade to 0.69.7

yarn install react-native@0.69.7
# list react-native version
yarn list react-native

yarn android

# use local 29758 port proxy download https://boostorg.jfrog.io/artifactory/main/release/1.76.0/source/boost_1_76_0.tar.gz to node_modules\expo-modules-core\android\build\downloads in powershell

$env:http_proxy = 'http://localhost:29758'
$env:https_proxy = 'http://localhost:29758'

function DownloadFileIfNotExists($url, $filePath) {
    if (-not (Test-Path -Path $filePath)) {
        Write-Host "Downloading $url to $filePath"
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($url, $filePath)
    }
}

DownloadFileIfNotExists 'https://boostorg.jfrog.io/artifactory/main/release/1.76.0/source/boost_1_76_0.tar.gz' 'node_modules\expo-modules-core\android\build\downloads\boost_1_76_0.tar.gz'

DownloadFileIfNotExists 'https://src.fedoraproject.org/repo/pkgs/folly/folly-2021.06.28.00.tar.gz/sha512/1e915aece4097b70548393b4ede49e565505c930f3af9be3525ca17ed6b18efb75638f4965fe136d9b7ac596b43a936b9db5880dbd8cba2461c1348a5dba1df4/folly-2021.06.28.00.tar.gz' 'node_modules\expo-modules-core\android\build\downloads\folly-2021.06.28.00.tar.gz'
