#!/bin/bash
#cd /home/pup/headless/puppeteer
echo "checking version.."
version=$(su -c "cd /home/pup/headless/puppeteer && ./extract.sh" pup)
echo "latest version is:$version"
read -p "any key..>"
file="bedrock-server-$version.zip"
echo "Downloading $file"
curl -OL "https://www.minecraft.net/bedrockdedicatedserver/bin-linux/$file" \
  -H 'accept: */*' \
  -H 'accept-language: en-AU,en;q=0.9,en-US;q=0.8,zh-TW;q=0.7,zh;q=0.6,ja;q=0.5,de;q=0.3' \
  -H 'content-type: text/plain;charset=UTF-8' \
  -H 'dnt: 1' \
  -H 'origin: https://www.minecraft.net' \
  -H 'priority: u=1, i' \
  -H 'referer: https://www.minecraft.net/' \
  -H 'sec-ch-ua: "Not)A;Brand";v="8", "Chromium";v="138", "Google Chrome";v="138"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-storage-access: active' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36' \

if [ $? -eq 0 ]; then
	mv $file /root/minecraft/optVersion
	cd /root/minecraft/optVersion
#	read -p "Unit test Completed (key down)>"
#	exit 0
	/root/minecraft/optVersion/Update_main.sh $file $version
else
	echo "(Update.sh) Download $file failure!"
	exit 1
fi


exit 0
