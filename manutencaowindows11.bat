@echo off
title Manutencao Windows 11
echo ============================================
echo   MANUTENCAO PREVENTIVA DO WINDOWS 11
echo ============================================
echo.
echo 1/8 - Verificando disco...
chkdsk C: /f /r /x
echo.
echo 2/8 - Verificando arquivos de sistema...
sfc /scannow
echo.
echo 3/8 - Reparando imagem do Windows...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo 4/8 - Limpando arquivos temporarios...
del /q /f /s %TEMP%\*
del /q /f /s C:\Windows\Temp\*
echo.
echo 5/8 - Abrindo limpeza de disco...
cleanmgr /sagerun:1
echo.
echo 6/8 - Reparando boot...
bootrec /fixmbr
bootrec /fixboot
bootrec /rebuildbcd
echo.
echo 7/8 - Otimizando disco...
defrag C: /O
echo.
echo 8/8 - Redefinindo rede...
netsh winsock reset
netsh int ip reset
ipconfig /flushdns
ipconfig /release
ipconfig /renew
echo.
echo ============================================
echo   MANUTENCAO CONCLUIDA! Reinicie o PC.
echo ============================================
pause
