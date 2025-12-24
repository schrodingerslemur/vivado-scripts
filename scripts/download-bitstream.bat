@echo off
setlocal

REM ===============================
REM Validate argument
REM ===============================
if "%~1"=="" (
    echo Usage: download-bitstream.bat ^<bitfile.bit^>
    exit /b 1
)

if not exist "%~1" (
    echo ERROR: Bitstream file not found: %~1
    exit /b 1
)

REM ===============================
REM Resolve absolute path
REM ===============================
set BITFILE=%~f1

REM ===============================
REM Vivado path (edit if needed)
REM ===============================
set VIVADO="C:\Xilinx\Vivado\2023.2\bin\vivado.bat"

REM ===============================
REM Run Vivado in batch mode
REM ===============================
%VIVADO% ^
  -mode batch ^
  -source download-bitstream.tcl ^
  -tclargs "%BITFILE%"

endlocal
