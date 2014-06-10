#!/bin/bash
scrot -s 'temp.png'
test=`base64 temp.png`
response=`curl -X POST 'https://api.imgur.com/3/image.json' -F 'image=@temp.png' --header "Authorization: Client-ID aa81f8c4b7443b8"`
picid=${response:15:7}
url='https://i.imgur.com/'$picid'.png'
rm -f temp.png
echo $url | xclip -selection clipboard
notify-send 'Success: '$url
xdg-open $url
