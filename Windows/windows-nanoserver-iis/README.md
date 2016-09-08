# windows-nanoserver-iis

Base IIS image.

## Build

You'll need to get a copy of `Microsoft-NanoServer-IIS-Package.cab` and `Microsoft-NanoServer-IIS-Package_en-us.cab` first.  They can be obtained from the Microsoft Server 2016 TP5 .iso.  Place them in the `\Packages` folder.  Then run the following command:

    docker build -t jpvantuyl/windows-nanoserver-iis .

You should see output simlar to the following:

    Sending build context to Docker daemon 229.4 MB
    Step 1 : FROM microsoft/nanoserver
    latest: Pulling from microsoft/nanoserver
    Digest: sha256:e161c43c9695a20d0b7271e7339bb041026db548667d2d9ecc04e8dc6fba9bed
    Status: Downloaded newer image for microsoft/nanoserver:latest
    ---> 3a703c6e97a2
    Step 2 : MAINTAINER John Van Tuyl (@jpvantuyl)
    ---> Running in e8300e35490f
    ---> ad0a6b1bf64d
    Removing intermediate container e8300e35490f
    Step 3 : COPY Provision /
    ---> 47c96a228f0e
    Removing intermediate container 26234a835043
    Step 4 : WORKDIR /
    ---> Running in a67b7e97f750
    ---> ac721e75ade2
    Removing intermediate container a67b7e97f750
    Step 5 : RUN powershell -Command         dism /online /apply-unattend:.\unattend.xml ;         net start w3svc ;
    ---> Running in d4a2590c3733

    Deployment Image Servicing and Management tool
    Version: 10.0.14300.1000

    Image Version: 10.0.14300.1000

    [=====                      10.1%                          ]
    [=============              24.1%                          ]
    [================           28.3%                          ]
    [================           28.3%                          ]
    [==================         32.5%                          ]
    [=====================      36.6%                          ]
    [=======================    40.8%                          ]
    [=======================    40.8%                          ]
    [========================== 45.0%                          ]
    [========================== 45.0%                          ]
    [===========================49.8%                          ]
    [===========================54.6%                          ]
    [===========================59.5%==                        ]
    [===========================64.3%=====                     ]
    [===========================69.1%========                  ]
    [===========================74.0%==========                ]
    [===========================74.0%==========                ]
    [===========================75.0%===========               ]
    [===========================77.2%============              ]
    [===========================79.2%=============             ]
    [===========================81.2%===============           ]
    [===========================83.2%================          ]
    [===========================84.2%================          ]
    [===========================85.2%=================         ]
    [===========================86.2%=================         ]
    [===========================87.2%==================        ]
    [===========================88.2%===================       ]
    [===========================89.2%===================       ]
    [===========================90.2%====================      ]
    [===========================92.7%=====================     ]
    [===========================92.7%=====================     ]
    [===========================93.7%======================    ]
    [===========================94.7%======================    ]
    [===========================95.7%=======================   ]
    [===========================96.7%========================  ]
    [===========================96.9%========================  ]
    [===========================97.3%========================  ]
    [===========================97.6%========================  ]
    [===========================98.6%========================= ]
    [==========================100.0%==========================]
    The operation completed successfully.
    The World Wide Web Publishing Service service is starting.
    The World Wide Web Publishing Service service was started successfully.

    ---> 2c82e2a066ca
    Removing intermediate container d4a2590c3733
    Step 6 : CMD ping localhost -t
    ---> Running in 3c6907e3c973
    ---> a1d94d0841f4
    Removing intermediate container 3c6907e3c973
    Successfully built a1d94d0841f4