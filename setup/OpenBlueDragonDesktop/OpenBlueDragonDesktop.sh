#!/bin/bash
#
# (c) tagServlet Ltd OpenBlueDragon GPL Project
#

##################################################
# Setup JAVA if unset
if [ -z "$JAVA" ]
then
  JAVA=$(which java)
fi

if [ -z "$JAVA" ]
then
  echo "Cannot find a Java JDK. Please set either set JAVA or put java (>=1.5) in your PATH." 2>&2
  exit 1
fi


##################################################
# Setup Java options
JAVACP="-classpath .:./lib/*"
JAVAOP="-Xmx128m"

$JAVA $JAVAOP $JAVACP com.bluedragon.desktop.Desktop &