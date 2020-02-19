@ECHO OFF
SETLOCAL EnableDelayedExpansion

DEL /S /Q _deps
MD _deps

PUSHD _deps
pip download dgl --pre --no-deps
POPD

ENDLOCAL
EXIT /B
