#!/bin/bash
#read -p "filename:" file
#read -p "version (like 1.21.43.01 ):" ver

file=$1
ver=$2

if [[ -n "$file" && -n "$ver" ]]; then
	echo "file=$file,ver=$ver"
	read -p "DoubleCheck.(AnyKeyDown)>"
else
	echo "(Update_main.sh) Usage: Update_main.sh <file> <version>"
	exit 1
fi

#exit

dir_name=/root/minecraft/be_$ver
mkdir $dir_name
if [ $? -eq 0 ]; then
  echo "Directory '$dir_name' created successfully."
else
  echo "(Update_main.sh)Failed to create directory '$dir_name'. It might already exist, or there might be a permission issue."
  echo "(Update_main.sh)Maybe you've already at the latest version! (version:$ver)"
  rm -f $file
  exit 2
fi


mv $file /root/minecraft/be_$ver
cd /root/minecraft/be_$ver
unzip *.zip

yes | cp -R /root/currentVersion/worlds /root/minecraft/be_$ver
yes | cp -R /root/currentVersion/resource_packs /root/minecraft/be_$ver
yes | cp /root/currentVersion/server.properties /root/minecraft/be_$ver 
yes | cp /root/currentVersion/allowlist.json /root/minecraft/be_$ver
yes | cp /root/currentVersion/permissions.json /root/minecraft/be_$ver
yes | cp /root/currentVersion/permissions_append.json /root/minecraft/be_$ver
yes | cp -R /root/currentVersion/definitions /root/minecraft/be_$ver

rm -f $file
rm -f /root/currentVersion
ln -s /root/minecraft/be_$ver /root/currentVersion

systemctl restart minecraft-bedrock
