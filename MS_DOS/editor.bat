@echo off
	
	::Samir Habibi
	::1819364
	::Operating Systems (MS-DOS Assignment)

REM Suitable introduction
echo SAFE TEXT EDITOR
echo Welcome

REM First check if user enters a parameter and how many.
REM Check if the user enters no parameter, if yes, enter interactive mode.
REM Check if user enters just one parameter, if yes, enter command line mode.
if [%1] neq [] GOTO parametercheck
if [%1] == [] GOTO interactivemode
if [%1] == [.txt] GOTO commandlinemode
if [%1] == [.bat] GOTO commandlinemode


:parametercheck
	REM Check if second parameters is entered. If yes, go to error and show message.
	if [%~2] neq [] GOTO error

	REM The program did not go to error, because not more than one parameter entered.
	REM Enter command line mode.
	GOTO commandlinemode

:commandlinemode
	REM Check if the file exists.
	if exist "%1" (
		REM Back the file up.
		copy "%1" "%1".bak
		echo File is backed up as %1.bak
		pause			
		"%1"
		exit /b
	) else (
		REM Create new file.
		echo File not found.
		echo Creating..
		pause
		notepad "%1"
		exit /b
	)

:interactivemode	
	REM Ask the user which file they want to edit.
	set /p f= Which file would you like to edit?	
	REM Check if the file exists.
	if exist %f% (
		REM Back the file up.
		copy %f% %f%.bak
		echo File is backed up as %f%.bak
		pause			
		%f%
		exit /b
	) else (
		REM Create new file.
		echo File not found.
		echo Creating..
		pause
		notepad %f%
		exit /b
		)

:error
	REM Show error messsage, and then restart the program. 
	echo Too many parameters entered!
	echo This text editor can only take one parameter at a time.
	pause
	exit /b