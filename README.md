# hcxtools

Simple alpine hcxpcaptool Dockerfile for conversion of cap/pcap/pcapng WiFi dump files to hashcat formats. The original repository of hcxtools can be found on https://github.com/ZerBea/hcxtools.

## Download from DockerHub

You can use the image from DockerHub.

```shell
# pull from DockerHub
$ docker pull slorenz/hcxpcaptool
```

## Build by your self

If you don't like to use my Docker image from DockerHub [here](https://hub.docker.com/r/slorenz/hcxpcaptool), you can build by your self after clone. Here an example...

```shell
# change into directory of Dockerfile
$ cd /path/of/Dockerfile

# run Docker build
$ docker build  --pull -t alpine/hcxtools .
```

## Usage

After download/build of image the following way can be used:

```shell
# create Project and cap directory
$ mkdir -p ~/Projects/MyCapFiles/cap

# change into project
$ cd ~/Projects/MyCapFiles

# copy pcap files into cap directory
$ cp cp ~/bettercap-wifi-handshakes.pcap cap/

# run Docker container
$ docker run -ti --rm --mount src="$(pwd)/cap",target=/hcxpcaptool,type=bind alpine/hcxtools bettercap-wifi-handshakes.pcap 

# read converted output file
$ cat cap/pmkid.16800
```

Note: Inside the container the directory "/hcxpcaptool" must contain the cap/pcap/pcapng WiFi dump - in the example I use "bettercap-wifi-handshakes.pcap" which is stored inside local "cap" directory. After successful execution the text file "pmkid.16800" is generated.

