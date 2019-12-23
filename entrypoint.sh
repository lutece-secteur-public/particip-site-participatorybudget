#!/bin/bash

# Start MySQL
/usr/bin/mysqld_safe &
for i in {30..0}; do
	if echo 'SELECT 1' | mysql &> /dev/null; then
		break
	fi
	sleep 1
done
if [ "$i" = 0 ]; then
	echo >&2 'MySQL init process failed.'
	exit 1
fi

# Start Tomcat
/usr/lib/jvm/default-java/bin/java -Djava.util.logging.config.file=/var/lib/tomcat8/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.awt.headless=true -Xmx512m -XX:+UseConcMarkSweepGC -Djdk.tls.ephemeralDHKeySize=2048 -Djava.endorsed.dirs=/usr/share/tomcat8/endorsed -classpath /usr/share/tomcat8/bin/bootstrap.jar:/usr/share/tomcat8/bin/tomcat-juli.jar -Dcatalina.base=/var/lib/tomcat8 -Dcatalina.home=/usr/share/tomcat8 -Djava.io.tmpdir=/tmp/tomcat8-tomcat8-tmp org.apache.catalina.startup.Bootstrap start


