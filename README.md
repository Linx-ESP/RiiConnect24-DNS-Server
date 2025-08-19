# FORK

Changes from original:

- No executables, just the lists
- Updated domains using WiiLink DNS (December 2024). DNS_ZONES.JSON IS NOT UP TO DATE.
- Added shell script to query the WiiLink DNS and output in hosts format.
- ~~Added rewrite list formatted for Adguard Home (add it to blacklists).~~
  - Adguard Home does support host format blacklist, and seems to require it for rewrites.
  - For rewrites to work: DNS Settings > Blocking mode > Default. This way uses the given IP to rewrite.
- Removed "mariokartwii.race.gs.wiimfi.de" because you can use any public DNS server.
- Removed "nplus.prod.silverbirchstudios.com" as it isn't resolved neither in public DNS servers nor WiiLink's.
- Added [Insignia for Xbox](https://insignia.live/)
