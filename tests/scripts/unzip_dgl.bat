@ECHO OFF
SETLOCAL EnableDelayedExpansion

PUSHD _deps
REN dgl.whl dgl-whl.zip
powershell -command "Expand-Archive dgl-whl.zip ."
POPD

ENDLOCAL
EXIT /B
