@echo off
echo --------------------WARNING--------------------
echo [%1] folder will be deleted
echo --------------------WARNING--------------------
pause
echo Deleting [%1] folder. 
time /T
del /f/s/q %1 >nul
rmdir /s/q %1 >nul
echo Files and folders have been deleted successfully! 
time /T
pause