FROM anapsix/alpine-java:8_server-jre

RUN ["mkdir", "-p", "/usr/local/hello"]

COPY hello-impl/target/universal/hello-impl-1.0-SNAPSHOT.zip /usr/local/hello

RUN ["unzip", "/usr/local/hello/hello-impl-1.0-SNAPSHOT.zip", "-d", "/usr/local/hello"]

RUN wget http://central.maven.org/maven2/org/aspectj/aspectjweaver/1.9.1/aspectjweaver-1.9.1.jar

RUN mv aspectjweaver-1.9.1.jar /usr/local/hello/hello-impl-1.0-SNAPSHOT/lib/

RUN ln -sf "/usr/local/hello/hello-impl-1.0-SNAPSHOT/bin/hello-impl" "/usr/local/bin/hello"

EXPOSE 9000

EXPOSE 9999

ENV JAVA_OPTS="-javaagent:/usr/local/hello/hello-impl-1.0-SNAPSHOT/lib/aspectjweaver-1.9.1.jar -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=9999"

RUN ["ls", "-l", "/usr/local/hello/hello-impl-1.0-SNAPSHOT"]

CMD ["/usr/local/bin/hello"]