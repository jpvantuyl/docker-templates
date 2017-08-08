FROM microsoft/windowsservercore

LABEL description jpvantuyl/dotnet-full-sdk with the .NET SDK installed.

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Write-Host "[$(Get-Date)] Set environment variables"; \
    [Environment]::SetEnvironmentVariable('FRAMEWORKPATH', 'C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework', [EnvironmentVariableTarget]::Machine);

RUN Write-Host "[$(Get-Date)] Install .NET + ASP.NET"; \
    Install-WindowsFeature NET-Framework-45-ASPNET; \
    Install-WindowsFeature Web-Asp-Net45;

RUN Write-Host "[$(Get-Date)] Install .NET 4.6.2 SDK"; \
    Invoke-WebRequest "https://download.microsoft.com/download/E/F/D/EFD52638-B804-4865-BB57-47F4B9C80269/NDP462-DevPack-KB3151934-ENU.exe" -OutFile "$env:TEMP\NDP462-DevPack-KB3151934-ENU.exe" -UseBasicParsing; \
    cmd /c start /WAIT "$env:TEMP\NDP462-DevPack-KB3151934-ENU.exe /install /quiet"; \
    rm "$env:TEMP\*"; \
    cp -r "${env:FRAMEWORKPATH}\v4.6.2" "${env:FRAMEWORKPATH}\v4.6.1"; \
    cp -r "${env:FRAMEWORKPATH}\v4.6.2" "${env:FRAMEWORKPATH}\v4.5.2"; \
    cp -r "${env:FRAMEWORKPATH}\v4.6.2" "${env:FRAMEWORKPATH}\v4.0";

CMD ["cmd"]
