@echo off

REM Arguments
set EXPECTED_ARGS=1

set LIB_DIR=%~dp0
IF "%LIB_DIR:~-1%"=="\" SET LIB_DIR=%LIB_DIR:~0,-1%

set CONN_STR=%1

REM Count the number of passed in args
set ARGS_CNT=0
for %%x in (%*) do Set /A ARGS_CNT+=1
REM Make sure the correct number of arguments were received
if %ARGS_CNT% neq %EXPECTED_ARGS% (
  echo "Wrong number of args; Received $#; Expected %EXPECTED_ARGS%"
  call:print_usage
  goto:eof
)
REM Warn if TNS_ADMIN is not set.
if "%TNS_ADMIN%"=="" (
  echo "WARNING: For TNS connections, the TNS_ADMIN environment variable must be set to the directory containing TNSNAMES.ora"
)

echo "INPUT:"
echo CONN_STR:%CONN_STR%

echo exit | sql -L %CONN_STR% @%LIB_DIR%/scriptWrap %LIB_DIR%

echo "Finished"
goto:eof

:print_usage
  echo "dmdump connect_string"
  echo "connect_string format can be:"
  echo "  hr/hr@//server:port/service_name"
  echo "  hr/hr@//server:port:sid"
  echo "  hr/hr@TNSNAME"
goto:eof
