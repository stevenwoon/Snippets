#!/bin/bash

# Returns the value from a config file, e.g.
#   [UserInfo]
#   name = Steven
#   userid = swoon
#   groups = admin,dev,user
#
#   [Servers]
#   name = Dev
#   status = active

# usage: $0 config-file section key

ini_get () {
    awk -v section="$2" -v variable="$3" '
        $0 == "[" section "]" { in_section = 1; next }
        in_section && $1 == variable {
            $1=""
            $2=""
            sub(/^[[:space:]]+/, "")
            print
            exit 
        }
        in_section && $1 == "" {
            # we are at a blank line without finding the var in the section
            print "not found" > "/dev/stderr"
            exit 1
        }
    ' "$1"
}

#Username=$( ini_get app.conf UserInfo name )
User=$( ini_get $1 $2 $3 )
echo $User
