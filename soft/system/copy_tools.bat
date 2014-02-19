Copy /y curl.cmd %ProgramFiles%\Git\cmd\
xcopy vim_tools C:\vim_tools\ /e/s/d 
xcopy glo628wb C:\glo628wb\ /e/s/d 
Copy /y ag\ag.exe C:\vim_tools\
Copy /y ag\libgcc_s_dw2-1.dll %windir%\system32\
Copy /y ag\liblzma-5.dll %windir%\system32\
Copy /y ag\libpcre-1.dll %windir%\system32\
Copy /y ag\libz-1.dll %windir%\system32\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;C:\vim_tools"

pause
