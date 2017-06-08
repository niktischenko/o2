set originalDir=%CD%
rd  /s /q %originalDir%\bin
mkdir %originalDir%\bin
mkdir %originalDir%\bin\include
mkdir %originalDir%\bin\win32
mkdir %originalDir%\bin\win64

call generate_solution.bat
cd %originalDir%\build32

%MOVAVI_SDK_PKG%\Tools\cmake\3.7.2\bin\cmake.exe --build . --target INSTALL --config Release > nul
echo f | xcopy /f /y /s %originalDir%\build32\install\lib\o2.lib %originalDir%\bin\win32\o2.lib

%MOVAVI_SDK_PKG%\Tools\cmake\3.7.2\bin\cmake.exe --build . --target INSTALL --config Debug > nul
echo f | xcopy /f /y /s %originalDir%\build32\install\lib\o2.lib %originalDir%\bin\win32\o2d.lib

cd %originalDir%
call generate_solution_X64.bat
cd %originalDir%\build64

%MOVAVI_SDK_PKG%\Tools\cmake\3.7.2\bin\cmake.exe --build . --target INSTALL --config Release > nul
echo f | xcopy /f /y /s %originalDir%\build64\install\lib\o2.lib %originalDir%\bin\win64\o2.lib

%MOVAVI_SDK_PKG%\Tools\cmake\3.7.2\bin\cmake.exe --build . --target INSTALL --config Debug > nul
echo f | xcopy /f /y /s %originalDir%\build64\install\lib\o2.lib %originalDir%\bin\win64\o2d.lib

xcopy /f /y /s %originalDir%\build32\install\include %originalDir%\bin\include
echo f | xcopy /f /y /s %originalDir%\src\o0export.h %originalDir%\bin\include\o2

cd %originalDir%
echo -- %DATE% %TIME%
