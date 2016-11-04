
cd /Users/voipke/Desktop/KuickMeetingDmg/
echo "remove old Installer.app"
rm -rf dmg/Installer.app
echo "copy installer to local installer"
#mkdir dmg
#cp -R /Users/voipke/Library/Developer/Xcode/DerivedData/Installer-grvfbrnjqfyooocbrxpqtmjocwim/Build/Products/Release/Installer.app ./dmg/Installer.app/
cp -R /Users/voipke/Library/Developer/Xcode/DerivedData/Installer-fpoclectrqkuujceecupbpmvsimj/Build/Products/Release/Installer.app ./dmg/Installer.app/
codesign -f -s "Developer ID Application: Beijing Chuchu Technology Co., Ltd. (L29YFZ9T4U)" ./dmg/Installer.app
#codesign -vv -d ./Installer.app

echo "remove old KuickMeeting"
#rm ./Installer.app/Contents/MacOS/KuickMeeting
echo "copy OSXvnc-server to local KuickMeeting"
cp /Users/voipke/Library/Developer/Xcode/DerivedData/OSXvnc-abinkjaaxvmjkhbabbugxmdtyfhx/Build/Products/Development/OSXvnc-server ./KuickMeeting
echo "codesign KuickMeeting"
codesign -f -s "Developer ID Application: Beijing Chuchu Technology Co., Ltd. (L29YFZ9T4U)" ./KuickMeeting
echo "KuickMeeting sign information"
#codesign -vv -d ./Installer.app/Contents/MacOS/kuickMeeting
echo "crete dmg file"
#rm KuickMeetingInstaller.dmg

#cp version ./dmg/version
version=`cat ./version`
rm KuickMeetingInstaller_v$version.dmg
mkdir -p KuickMeetingInstaller_v$version

cp KuickMeeting KuickMeetingInstaller_v$version/
cp version KuickMeetingInstaller_v$version/
cp -R /Users/voipke/Library/Developer/Xcode/DerivedData/Installer-fpoclectrqkuujceecupbpmvsimj/Build/Products/Release/Installer.app.dSYM ./KuickMeetingInstaller_v$version/ 
cp -R /Users/voipke/Library/Developer/Xcode/DerivedData/OSXvnc-abinkjaaxvmjkhbabbugxmdtyfhx/Build/Products/Development/OSXvnc-server.dSYM ./KuickMeetingInstaller_v$version/ 
hdiutil create -format UDZO -srcfolder dmg  KuickMeetingInstaller_v$version.dmg
