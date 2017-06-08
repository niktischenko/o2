@echo off
set originalDir=%CD%
mkdir %~dp0build64
cd %~dp0build64
%MOVAVI_SDK_PKG%\Tools\cmake\3.7.2\bin\cmake.exe ^
-Do2_WITH_DROPBOX=true ^
-Do2_WITH_FACEBOOK=true ^
-Do2_WITH_GOOGLE=true ^
-Do2_WITH_QT5=true ^
-Do2_WITH_VIMEO=true ^
-DCMAKE_INSTALL_PREFIX=./install ^
-DCMAKE_PREFIX_PATH="%MOVAVI_SDK_PKG%\extracted\Qt\5.6\win-vs2015-v140_xp-x86\lib\cmake\Qt5" ^
-G "Visual Studio 14 2015 Win64" %~dp0
cd %originalDir%
echo -- %DATE% %TIME%
