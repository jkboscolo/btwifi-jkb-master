#!/bin/bash

#from https://gist.github.com/sscarduzio

# CONF

DBG=true
RELOG_UNAME=emporioalexandre@gmail.com
RELOG_PASSW=Alex2222

# END CONF

IS_LOGGED_IN=$(wget "https://www.btopenzone.com:8443/home" --timeout 30 -O - 2>/dev/null | grep "accountLogoff")

if [ "$IS_LOGGED_IN" ]

then
  [[ $DBG ]] && echo "currently logged in. Nothing to do.."

else
  [[ $DBG ]] && echo "It's not logged in.. Will log in!"
  OUT=$(wget -qO- --post-data "USERNAME=$emporioalexandre@gmail.com&PASSWORD=$Alex2222” "https://btwifi.portal.fon.com/remote?res=hsp-login&HSPNAME=FonBT%3AGB&WISPURL=https%3A%2F%2Fwww.btopenzone.com%3A8443%2FfonLogon&WISPURLHOME=https%3A%2F%2Fwww.btopenzone.com%3A8443&VNPNAME=FonBT%3AGB&LOCATIONNAME=FonBT%3AGB")
  ONLINE=$(echo $OUT | grep youre_online )
  if [ "$ONLINE" ]
  then
    [[ $DBG ]] && echo "You're online!"
  else
    [[ $DBG ]] && echo "Could not login :("
  fi
fi

