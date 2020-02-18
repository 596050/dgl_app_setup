@ECHO OFF
SETLOCAL EnableDelayedExpansion

IF x%1x==xx (
	ECHO Specify backend
	EXIT /B 1
) ELSE (
	SET BACKEND=%1
)
CALL workon %BUILD_TAG%

SET PYTHONPATH=!CD!\python;!PYTHONPATH!
SET DGLBACKEND=!BACKEND!
SET DGL_DOWNLOAD_DIR=!CD!

python -m pip install pytest || EXIT /B 1
python -m pytest -v --junitxml=pytest_unit.xml tests\unittests || EXIT /B 1

ENDLOCAL
EXIT /B
