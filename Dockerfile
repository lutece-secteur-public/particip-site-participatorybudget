FROM lutece/builder as builder

# define the fully qualified artifact of the site
ARG site=site-participatorybudget-1.0.0-SNAPSHOT
ARG http_proxy_host=
ARG http_proxy_port=
ARG https_proxy_host=
ARG https_proxy_port=

# build the site and assemble the webapp
WORKDIR /app
ADD pom.xml /app/pom.xml
ADD dump.sql /app/dump.sql
ADD webapp /app/webapp

WORKDIR /app

RUN mvn -Dhttp.proxyHost=${http_proxy_host} -Dhttp.proxyPort=${http_proxy_port} -Dhttps.proxyHost=${https_proxy_host} -Dhttps.proxyPort=${https_proxy_port} clean lutece:site-assembly

# change default user
RUN  sed -i 's/root/admin/' /app/target/${site}/WEB-INF/conf/db.properties

RUN mv /app/target/${site}/ /var/lib/tomcat8/webapps/pb

# run the database initialization script
RUN  /etc/init.d/mysql start && \
    sleep 5s && \
    mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'changeit'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';CREATE DATABASE pb" && \
   sleep 5s && \
    mysql -uadmin -pchangeit pb < dump.sql && \
    sleep 5s && \
    /etc/init.d/mysql stop 

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
