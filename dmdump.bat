@echo off

REM Arguments
set EXPECTED_ARGS=5

set LIB_DIR=%~dp0
IF "%LIB_DIR:~-1%"=="\" SET LIB_DIR=%LIB_DIR:~0,-1%

set USER=%1
set PASS=%2
set SERVER=%3
set PORT=%4
set SID=%5

REM Count the number of passed in args
set ARGS_CNT=0
for %%x in (%*) do Set /A ARGS_CNT+=1
REM Make sure the correct number of arguments were received
set VALID_ARGS=true
if %ARGS_CNT% neq %EXPECTED__ARGS% set VALID_ARGS=false
if "%VALID_ARGS%" == "false" (
  echo "Wrong number of args; Received $#; Expected %EXPECTED_ARGS%" >&2
  call:print_usage
  goto:eof
)

echo "INPUT:"
echo USER:%USER%
echo PASS:%PASS%
echo SERVER:%SERVER%
echo PORT:%PORT%
echo SID:%SID%

echo "exit" | sql %USER%/%PASS%@//%SERVER%:%PORT%/%SID% @%LIB_DIR%/scriptWrap %LIB_DIR%

echo "Finished"
goto:eof

:print_usage
  echo "dmdump schema password server port sid"
goto:eof
