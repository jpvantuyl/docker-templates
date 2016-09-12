# windows-nanoserver-fullyloaded

An attempt to fully load up a NanoServer docker image.  After testing .cab files one by one only three packages seem loadable without triggering a reboot (which Docker can't handle).

- `Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-DSC-Package.cab`
- `Dism /online /add-package /packagepath:c:\packages\Microsoft-NanoServer-DNS-Package.cab`

I didn't feel the need to add the DNS package since I have no use for such a thing.

## Build

You'll need to get a copy of `Microsoft-NanoServer-IIS-Package.cab`, `Microsoft-NanoServer-IIS-Package_en-us.cab`, `Microsoft-NanoServer-DSC-Package.cab`, and `Microsoft-NanoServer-DSC-Package_en-us.cab` first.  They can be obtained from the Microsoft Server 2016 TP5 .iso.  Place them in the `\Packages` folder.  Then run the following command:

    docker build -t jpvantuyl/windows-nanoserver-fullyloaded .

# Run

To fire it up try the following from an elevated Powershell session:

    docker run -it jpvantuyl/windows-nanoserver-fullyloaded
