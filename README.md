# OpenThreadBleSecure

OpenThread extension - TLS based BLE point-2-point link for commissioning

This project contains additions to OpenThread and a BLE radio driver example for Nordic nRF52840.
For testing, the modified version of openthread in this project must be used (copy to SDK folder [SDK folder]\modules\lib\openthread).
The radio driver is part of the main project and is intended to be integrated with the SDK later.
<br>
##### Building with nRF52840 dongle

- - -

**Kconfig fragments:**
overlay-usb.conf

**CMake arguments:**
-DDTC\_OVERLAY\_FILE="usb.overlay"