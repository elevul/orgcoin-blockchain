@echo off
echo "First run starting"
IF EXIST %USERPROFILE%\AppData\Roaming\OrgCoin (
echo "Previous install detected"
echo "Backing up wallet.dat file"
move /Y %USERPROFILE%\AppData\Roaming\OrgCoin\wallet.dat .
echo "Backing up old blockchain"
xcopy /E/C/I/Y %USERPROFILE%\AppData\Roaming\OrgCoin\blocks blocks
echo "Removing old version (if any)"
rmdir /S/Q %USERPROFILE%\AppData\Roaming\OrgCoin
mkdir %USERPROFILE%\AppData\Roaming\OrgCoin\
echo "Restoring wallet.dat file"
move /Y wallet.dat %USERPROFILE%\AppData\Roaming\OrgCoin\
) ELSE (
echo "No previous install detected"
)

echo "Copying blockchain snapshot"
xcopy /E/C/I/Y blocks %USERPROFILE%\AppData\Roaming\OrgCoin\blocks\
echo "Final cleanup of install directory"
rmdir /S/Q blocks
echo "Starting orgcoin-qt for the first time, note that this may take some time."  
echo "Please be patient"
orgcoin-qt.exe