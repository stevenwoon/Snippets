#!/bin/bash

# Returns the value from a config file, e.g.
#   [UserInfo]
#   name = Steven
#   userid = swoon
#   groups = admin,dev,user
#
#   [Servers]
#   name = Development Plano
#   name = Development Dallas
#   name = Production 

# There must be a space between the '=' delimiters.


# usage: $0 config-file section key

ini_get () {
    awk -v section="$2" -v variable="$3" '
        $0 == "[" section "]" { in_section = 1; next }
        in_section && $1 == variable {
            $1=""
            $2=""
            sub(/^[[:space:]]+/, "")
#            print $3,$NF ""
	    for (i=3; i<=NF; ++i) printf ("%s ",$i)
            print ""
            next 
        }
        in_section && $1 == "" {
            # we are at a blank line without finding the var in the section
            # print "not found" > "/dev/stderr"
            exit 1
        }
    ' "$1"
}

#Username=$( ini_get app.conf UserInfo name )
#echo -e "$( ini_get $1 $2 $3 )"

User=$( ini_get $1 $2 $3 )
echo -e "$User"


