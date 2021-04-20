# Build webdsl
FROM frekele/ant:1.10.3-jdk8
RUN apt update && apt install -y wget unzip
RUN wget https://buildfarm.metaborg.org/job/webdsl-compiler/lastSuccessfulBuild/artifact/webdsl.zip
RUN unzip webdsl.zip
ENV PATH "$PATH:/root/webdsl/bin"

# Sanity check
RUN webdsl version

# Actually build project
ARG app_name
COPY ./src /webdsl-project
COPY ./application.ini /webdsl-project/
RUN sed -i "1s/.*/appname=$app_name/" /webdsl-project/application.ini
RUN cd /webdsl-project && webdsl clean build war

# Now launch Tomcat
FROM tomcat:7-jdk8-corretto
RUN yum -y install ant
RUN mkdir -p /usr/local/tomcat/webapps/$app_name
COPY --from=0 /webdsl-project/*.xml /usr/local/tomcat/webapps/$appname
COPY --from=0 /webdsl-project/*.war /usr/local/tomcat/webapps
