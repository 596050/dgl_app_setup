@ECHO OFF
SETLOCAL EnableDelayedExpansion

DEL /S /Q _deps
MD _deps

PUSHD _deps
pip download dgl --pre --no-deps
unzip dgl*.whl
DEL /S /Q dgl*.whl
POPD

ENDLOCAL
EXIT /B
