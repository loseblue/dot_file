Copy /y curl.cmd %ProgramFiles%\Git\cmd\
xcopy vim_tools C:\vim_tools\ /e/s/d 
xcopy gnu_global C:\gnu_global\ /e/s/d 
Copy /y plantuml.jar C:\vim_tools\ 
Copy /y plantuml.jar C:\Windows\System32\ 
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;C:\vim_tools\;C:\gnu_global\bin\"

pause
