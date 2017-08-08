FROM jpvantuyl/dotnet-full-msbuild:vs2015

LABEL description Microsoft .NET Test Tools.

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Write-Host "[$(Get-Date)] Install VSTest"; \
    Invoke-WebRequest "https://download.microsoft.com/download/6/0/e/60e06c19-2bfd-40da-8af8-4cd7b897a336/vstf_testagent.exe" -OutFile "$env:TEMP\vstf_testagent.exe" -UseBasicParsing; \
    cmd /c start /WAIT "$env:TEMP\vstf_testagent.exe /Full /Q"; \
    rm "$env:TEMP\vstf_testagent.exe";

CMD ["cmd"]
