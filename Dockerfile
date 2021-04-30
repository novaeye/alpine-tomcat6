FROM zhangpeihao/alpine-java6

ADD apache-tomcat-6.0.37.tar.gz /tmp/apache-tomcat-6.0.37

RUN cd /usr/local && \
    mv /tmp/apache-tomcat-6.0.37/apache-tomcat-6.0.37 ./apache-tomcat-6.0.37 && \
    ln -s ./apache-tomcat-6.0.37 ./tomcat && \
    rm -rf /usr/local/tomcat/webapps/* && \
    rm -rf /usr/local/tomcat/conf/Catalina/* && \
    rm -rf /usr/local/tomcat/logs/*
    
ADD server.xml /usr/local/tomcat/conf/server.xml

ENV CATALINA_HOME /usr/local/tomcat

CMD /usr/local/tomcat/bin/catalina.sh run

EXPOSE 8080
