@echo off
COLOR 0A
echo --------------------------------------------------------------------------
echo =THis is the alpha release                                               =
echo =bugs are inevitable                                                     =
echo =brick your device on your own behalf                                    =
echo =I will not be responsible for burning your house or murdering your wife =
echo --------------------------------------------------------------------------
echo.
:CHOICE
set nxt=0
set ric=0
echo Device type:
echo 1) Unlock Bootloader
echo 2) Root
echo 3) Root v2 If "Root" didn't work
echo 4) Changelog
echo 4) BugReport
echo.
echo x) Exit!
echo.
set /p type=Make a choice: 
if %type% == 1 GOTO Unlock
if %type% == 2 GOTO Root
if %type% == 3 GOTO Root v2
if %type% == 4 GOTO Changelog
if %type% == 5 GOTO BugReport
if %type% == x GOTO Exit
echo.
echo Please Enter a valid number (1 to x)
echo.
GOTO CHOICE

:Unlock
cd deamons
fastboot oem get_identifier_token
echo  Copy the identifier token to your clipboard.If you don't know how to do
echo  this then stop now and choke yourself to death
echo  Don't like the above idea!
echo  PSST! google it
echo  !!!!!!!!!!!!!!!!!!!!!!!!!
echo  A webpage will open.
echo  Click unlock bootloader and follow the steps
echo  Paste the token and youll get the unlock code via email
echo  Pase it in the deamons folder
adb kill-server
Unlock.html
echo  Now that wasn't so bad after all was it?
echo  incase you didn't know....
echo  !!!Breaking News!!!
echo  Your phone has been reset...


:Root
cd deamons
adb kill-server
adb start-server
adb wait-for-device
adb push -p Supersu /sdcard/supersu.zip
adb push openrecoveryscript /cache/recovery/openrecoveryscript
adb reboot-bootloader
echo oh wow HBOOT opended
echo Use the volume key and select fastboot
fastboot wait-for-device 
fastboot flash reocvery recovery.img
fastboot erase cache
fastboot reboot recovery
echo Done!

:Root v2
cd deamons
adb kill-server
adb start-server
adb wait-for-device
adb push -p Supersu /sdcard/supersu.zip
adb reboot-bootloader
echo oh wow HBOOT opended
echo Use the volume key and select fastboot
fastboot wait-for-device 
fastboot flash reocvery recovery.img
fastboot erase cache
fastboot reboot recovery
echo use volume keys or touch and select Flash zip>choose zip from sdcard>choose supersu.zip>install
echo Done!

:Changelog
echo  v0.1 alpha 
echo The first general release which should be buggy

echo  v0.2 beta
echo  Fixed some bugs(May be still buggy)
echo  Updated adb
echo  Implemented Root v2.All hail Saad the Savior
goto choice



:BugReport

echo Contact :qsaads@live.com

goto choice 


:Exit 
echo Stay tuned for updates
echo Need testers
pause



























