@ECHO OFF
SETLOCAL EnableDelayedExpansion

IF x%1x==xx (
	ECHO Specify backend
	EXIT /B 1
) ELSE (
	SET BACKEND=%1
)
CALL workon %BUILD_TAG%

SET PYTHONPATH=!CD!\python;!CD!\_deps;!PYTHONPATH!
SET DGLBACKEND=!BACKEND!
SET DGL_DOWNLOAD_DIR=!CD!

python -m pip install _deps\\dgl*.whl --user || EXIT /B 1
python -m pip install pytest --user || EXIT /B 1
python -m pytest -v --junitxml=pytest_unit.xml tests\unittests || EXIT /B 1

ENDLOCAL
EXIT /B
