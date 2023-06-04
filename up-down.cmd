@echo off
setlocal

for /f "usebackq" %%X in (`compose ps -q`) do set DCPS=%%X
if ""%DCPS%%""=="""" (goto __LAUNCH__) else (goto __SHUTDOWN__)

:__LAUNCH__
echo Launch...
compose build
start http://localhost:8888
compose up
goto __END__

:__SHUTDOWN__
echo Shutdown...
compose down
goto __END__

:__END__