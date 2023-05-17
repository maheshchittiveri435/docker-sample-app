@echo off

set "latest_java_pid="

for /f "tokens=2 delims=," %%p in ('wmic process where "name='java.exe' and CommandLine like '%%%CD%%%'" get processid /format:csv') do set "latest_java_pid=%%~p"

if defined latest_java_pid (
    taskkill /F /PID %latest_java_pid%
    echo Java process with PID %latest_java_pid% has been terminated.
) else (
    echo Java process not found.
)

pause
