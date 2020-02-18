REM Needs vcvars64.bat to be called
git submodule init
git submodule update --recursive
cd python
"%PYTHON%" setup.py install --single-version-externally-managed --record=record.txt || EXIT /B 1
EXIT /B
