FROM microsoft/nanoserver

MAINTAINER John Van Tuyl (@jpvantuyl)

COPY Provision /
WORKDIR /

RUN powershell -Command \
        dism /online /apply-unattend:.\unattend.xml ; \
        net start w3svc ; \        
        Remove-Item "C:\Packages","Unattend.xml","Apply-Unattend.ps1" -Force -Recurse;

CMD [ "powershell" ]
