@echo off
echo Compilando %1...
tasm /la /zi %1
IF ERRORLEVEL 1 GOTO error_label
tlink /l /s /v %1
IF ERRORLEVEL 1 GOTO error_label
goto end_label

:error_label
echo Nao foi possivel compilar %1
:end_label
