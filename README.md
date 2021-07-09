# balena-yocto-builder

## Introduction

This application allows you to offload building a balenaOS image to your
balena device.  This is inspired by the docker-balena project from @alexgg:

https://github.com/alexgg/docker-balena


## Preparing the application

Clone the yocto repository which will be included in the image.
```
git clone https://github.com/balena-os/balena-intel yocto-builder/yocto
```

Set the `MACHINE` environment variable to the device type you are building.
For example, `MACHINE: genericx86-64-ext`.

Modify the yocto project to suit your needs.

## Push the application to balenaCloud

Log into balenaCloud.
```
balena login
```

Create a fleet for this application.
```
balena app create balena-yocto-builder
```

Push the code to balenaCloud.
```
balena push balena-yocto-builder
```

Provision a balena device preferrably using a powerful x86_64 machine.
The device will immediately start building the balenaOS image as soon as
the container starts.  Once the build completes, the image can be downloaded
through a Caddy server listening on port 80.  You should be able to download
the images using the public device URL.
