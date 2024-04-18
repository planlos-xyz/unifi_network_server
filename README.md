# Unifi Network Server [Application] on Debian 12


Unifi offers a Unifi Network Server for self-hosting. However, installing it on a current Debian server (Bookwork) is not so straightforward. This is partly due to the outdated version of MongoDB used and the somewhat unclear instructions.

Therefore, I have written a script for Debian 12 that cleanly installs the UNS. Please copy the entire directory to the ROOT directory and run the install.sh file with ROOT privileges.


Afterward, you can access the web interface by navigating to https://[IP-ADRESS]:8443 and continue with the configuration.
