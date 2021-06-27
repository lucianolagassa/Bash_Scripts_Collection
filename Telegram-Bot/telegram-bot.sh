#!/bin/bash
# Edit TOKEN and ID Values. The TOKEN is managed from Telegram with Bot_Father.
TOKEN="##TELEGRAM-BOT-TOKEN##"
ID="##USER-OR-GROUP-ID##"
TEXT="$1"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
/usr/bin/curl -s -X POST $URL -d chat_id="$ID" -d text="$TEXT" > /dev/null
