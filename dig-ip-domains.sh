#!/bin/bash

dns_server="167.235.229.36" # WiiLink DNS Server

output_file_hosts="dns_zones-hosts.txt"
output_file_adguard="adguardhome-dnsrewrite.txt"

domains=(
"flipnote.hatena.com"
"maintenance.hatena.ne.jp"
"nas.nintendowifi.net"
"nwdsrvwdbctl.nintendo.co.jp"
"nzone001.nintendo-europe.com"
"axing.nintendowifi.net"
"cfh.wapp.wii.com"
"ente.wapp.wii.com"
"entj.wapp.wii.com"
"entu.wapp.wii.com"
"geckocodes.org"
"miicontest.wapp.wii.com"
"miicontestp.wapp.wii.com"
"ms.nintendo-europe.com"
"news.wapp.wii.com"
"nwcs.wapp.wii.com"
"rs.nintendo.com"
"syscheck.softwii.de"
"vt.wapp.wii.com"
"weather.wapp.wii.com"
"wii.nintendo.co.jp"
"wiirecommend.nintendo.com.au"
"wus.wapp.wii.com"
"ds.pokemon-gl.com"
"en-ds.pokemon-gl.com"
"es-ds.pokemon-gl.com"
"fr-ds.pokemon-gl.com"
"it-ds.pokemon-gl.com"
"ko-ds.pokemon-gl.com"
"pkvldtprod.nintendo.co.jp"
"gamestats.gs.nintendowifi.net"
"gamestats2.gs.nintendowifi.net"
"peerchat.gs.nintendowifi.net"
"secure.touchmasterconnect.com"
"pkgdsprod.nintendo.co.jp"
"naswii.nintendowifi.net"
"sake.gamespy.com"
"sake.gs.nintendowifi.net"
"gdata.youtube.com"
"natneg3.gs.nintendowifi.net"
"natneg2.gs.nintendowifi.net"
"available.gs.nintendowifi.net"
"gamespy.com"
"gs.nintendowifi.net"
"natneg1.gs.nintendowifi.net"
"natneg4.gs.nintendowifi.net"
"natneg5.gs.nintendowifi.net"
"natneg6.gs.nintendowifi.net"
"master.gs.nintendowifi.net"
    )



# Clear the output file if it exists
> $output_file_hosts
> $output_file_adguard
# It won't give a clean output if a domain answers multiple IPs. Doesn't handle errors.
# This must not output any IPv6 addresses. It shouldn't though.

for domain in "${domains[@]}"
do
  echo "Digging IP for $domain..."
  ip=$(dig +short $domain @$dns_server)
  echo "$ip $domain" >> $output_file_hosts
# Doesn't properly escape the dollar sign, manually fixed the file afterwards.
#  echo "||$ip^$dnsrewrite=NOERROR;A;$domain" >> $output_file_adguard
done

echo "Complete"