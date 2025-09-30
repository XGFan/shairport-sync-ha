#!/bin/ash

CONF_FILE="/etc/shairport-sync.conf"
OPTIONS_FILE="/data/options.json"
LOG_TAG="[shairport-init]"

echo "$LOG_TAG Starting script..."

# 读取 conf-url
CONF_URL=$(jq -r '.["conf-url"]' "$OPTIONS_FILE" 2>/dev/null)

if [ -z "$CONF_URL" ] || [ "$CONF_URL" = "null" ]; then
    echo "$LOG_TAG No conf-url found in $OPTIONS_FILE, using existing config."
else
    echo "$LOG_TAG Found conf-url: $CONF_URL"
    TMP_FILE=$(mktemp)

    if wget -q -O "$TMP_FILE" "$CONF_URL"; then
        mv "$TMP_FILE" "$CONF_FILE"
        echo "$LOG_TAG Config file updated from $CONF_URL"
    else
        rm -f "$TMP_FILE"
        echo "$LOG_TAG Failed to download config from $CONF_URL, keeping existing config."
    fi
fi

echo "$LOG_TAG Starting shairport-sync with config: $CONF_FILE"
exec shairport-sync -c "$CONF_FILE"
