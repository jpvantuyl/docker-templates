#doesn't work
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-IIS-Package.cab
# Dism /online /add-package /packagepath:c:\packages\en-us\Microsoft-NanoServer-IIS-Package_en-us.cab


#require a reboot
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Containers-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Compute-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-DCB-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Defender-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-FailoverCluster-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Guest-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Host-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-NPDS-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-OEM-Drivers-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-SCVMM-Compute-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-SCVMM-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-ShieldedVM-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-Storage-Package.cab
# Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-SecureStartup-Package.cab

#works
Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-DSC-Package.cab
Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-DNS-Package.cab


dism /online /apply-unattend:.\unattend.xml
