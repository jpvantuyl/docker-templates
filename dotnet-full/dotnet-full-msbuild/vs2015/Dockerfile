FROM jpvantuyl/dotnet-full-sdk:4.6.2

LABEL description Microsoft .NET Build Tools for Visual Studio 2015 (v14).

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Write-Host "[$(Get-Date)] Set environment variables"; \
    $env:PATH = 'C:\Program Files (x86)\MSBuild\14.0\Bin\;' + $env:PATH; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine); \
    [Environment]::SetEnvironmentVariable('SSDTPATH', 'C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v11.0\SSDT', [EnvironmentVariableTarget]::Machine); \
    [Environment]::SetEnvironmentVariable('DACPATH', 'C:\Extensions\Microsoft\SQLDB\Dac\130', [EnvironmentVariableTarget]::Machine);

RUN Write-Host "[$(Get-Date)] Install Chocolatey"; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install nuget.commandline -y --version 4.1.0;

RUN Write-Host "[$(Get-Date)] Install MSBuild for VS2015"; \
    Invoke-WebRequest "http://download.microsoft.com/download/4/3/3/4330912d-79ae-4037-8a55-7a8fc6b5eb68/buildtools_full.exe" -OutFile "$env:TEMP\BuildTools_Full.exe" -UseBasicParsing; \
    cmd /c start /WAIT "$env:TEMP\BuildTools_Full.exe /Silent /Full"; \
    rm "$env:TEMP\BuildTools_Full.exe";

RUN Write-Host "[$(Get-Date)] Install SQL Server Data Tools"; \
    nuget install Microsoft.Data.Tools.Msbuild -Version 10.0.61026 -OutputDirectory "$env:TEMP"; \
    mkdir "${env:SSDTPATH}"; \
    mv "$env:TEMP\Microsoft.Data.Tools.Msbuild.10.0.61026\lib\net40\*" "${env:SSDTPATH}"; \
    cp -r "${env:SSDTPATH}" "${env:DACPATH}";

RUN Write-Host "[$(Get-Date)] install Web targets"; \
    nuget install MSBuild.Microsoft.VisualStudio.Web.targets -Version 14.0.0.3 -OutputDirectory "$env:TEMP"; \
    mv "$env:TEMP\MSBuild.Microsoft.VisualStudio.Web.targets.14.0.0.3\tools\VSToolsPath\*" 'C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v14.0';

CMD ["C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe"]
