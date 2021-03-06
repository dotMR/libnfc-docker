Docker container to test out Adafruit's PN532 NFC Breakout Board

###Description
Dockerfile builds an Ubuntu container, installs and configures the libnfc library for use with the breakout board

###Usage
If running on a mac, you will need to expose the USB ports via VirtualBox (the latest extension pack is needed) as well as running the docker container under 'privileged' mode to forward the USB port to the container

		docker build -t my-nfc . \\ build container
		docker run --privileged -i -t my-nfc \\ run container

Once your container is running, you should be able to run the samples

		:cd utils
		nfc-scan-device \\ displays info about reader
		nfc-poll \\ poll the reader for a token

###Helpful Links
- http://forums.adafruit.com/viewtopic.php?f=19&t=29572&p=231140&hilit=pn532#p231140
- https://github.com/nfc-tools/libnfc/blob/master/README
- http://nfc-tools.org/index.php?title=Libnfc
- http://matt.bionicmessage.net/blog/2010/02/07/Poking%20around%20on%20a%20Mifare%20card:%20LibNFC%20crash%20course
- http://buzzdavidson.com/?p=499
- https://learn.adafruit.com/adafruit-pn532-rfid-nfc/ndef
