Copy /y curl.cmd %ProgramFiles%\Git\cmd\
xcopy vim_tools C:\vim_tools\ /e/s/d 
xcopy glo628wb C:\glo628wb\ /e/s/d 
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;C:\vim_tools"

pause
