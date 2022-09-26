@echo off

set ZBUILDDIR=build

where /q nrfutil.exe
IF ERRORLEVEL 1 (
     	echo.
	echo Application "nrfutil" not found.
        echo Installing with "pip install nrfutil ..."
        echo.
        pause
        pip install nrfutil
        echo.
        pause
        echo.
)

set /p ZCOM=<%~dp0\dongle_com_port.txt
set /p ZCOM=Enter COM port (format 'COMxx') or press enter for '%ZCOM%':
echo %ZCOM%>%~dp0\dongle_com_port.txt

nrfutil pkg generate --hw-version 52 --sd-req=0x00 --application %ZBUILDDIR%\zephyr\zephyr.hex --application-version 1 build.zip
echo.
echo Put dongle at port '%ZCOM%' in programming mode [side button]
echo - edit "dongle_com_port.txt" to change COM port -
nrfutil dfu usb-serial -pkg build.zip -p %ZCOM%
del build.zip

