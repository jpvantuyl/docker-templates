# Windows

Last updated: 2016/09/08

To install Docker on Windows 10 follow the [instructions](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_windows_10) or copy/paste the scripts below:

    # in an elevated Powershell session
    # 1) install Windows container features
    Enable-WindowsOptionalFeature -Online -FeatureName containers -All
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
    Restart-Computer -Force

    Set-ItemProperty -Path 'HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Containers' -Name VSmbDisableOplocks -Type DWord -Value 1 -Force


    # 2) Install Docker
    Invoke-WebRequest "https://master.dockerproject.org/windows/amd64/docker-1.13.0-dev.zip" -OutFile "$env:TEMP\docker-1.13.0-dev.zip" -UseBasicParsing
    Expand-Archive -Path "$env:TEMP\docker-1.13.0-dev.zip" -DestinationPath $env:ProgramFiles
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Docker", [EnvironmentVariableTarget]::Machine)

    # restart your elevated Powershell session
    dockerd --register-service
    Start-Service Docker
