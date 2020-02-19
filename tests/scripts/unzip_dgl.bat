@ECHO OFF
SETLOCAL EnableDelayedExpansion

PUSHD _deps
unzip dgl.whl
POPD

ENDLOCAL
EXIT /B
