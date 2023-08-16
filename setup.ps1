$JDK11 = "C:\progra~1\Eclipse Adoptium\jdk-11.0.16.101-hotspot"
$env:JAVA_HOME = $JDK11

# https://github.com/facebook/react-native/issues/35210
# for this reason, we need upgrade to 0.69.7

yarn install react-native@0.69.7
# list react-native version
yarn list react-native

yarn android