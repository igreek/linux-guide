#!/bin/bash -e
export JAVA_OPTS="-Xms100m -Xmx200m"
export JAVA_HOME=/usr/java/jdk1.8.0_111
export CATALINA_HOME=/opt/modules/server/tomcat8
export CATALINA_BASE="`pwd`"

case $1 in 
	start)
	$CATALINA_HOME/bin/catalina.sh start
		echo start app ok!
	;;
	stop)
	$CATALINA_HOME/bin/catalina.sh stop
		echo stop app ok!
	;;
	restart)
	$CATALINA_HOME/bin/catalina.sh stop 
		echo stop app ok!
		sleep 2
	$CATALINA_HOME/bin/catalina.sh start
		echo start app ok!
	;;
	esac
exit 0	

