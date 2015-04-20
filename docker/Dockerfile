FROM phusion/baseimage:0.9.9

MAINTAINER Per Arneng

RUN apt-get update ;\
    apt-get install vim

# --- install java ---
WORKDIR /opt
RUN wget --no-check-certificate --no-cookies\
      --header "Cookie: oraclelicense=accept-securebackup-cookie" \
      http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz ;\
	tar xvfz jdk-7u67-linux-x64.tar.gz ;\
	rm -rf jdk-7u67-linux-x64.tar.gz ;\
	ln -s /opt/jdk1.7.0_67 /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV PATH ${JAVA_HOME}/bin:$PATH

# --- install maven ---
ENV MVN_VERSION 3.3.1
WORKDIR /opt
RUN wget http://apache.mirrors.spacedump.net/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz ; \
	tar xvfz apache-maven-${MVN_VERSION}-bin.tar.gz ; \
	rm -rf apache-maven-${MVN_VERSION}-bin.tar.gz ; \
	ln -s /opt/apache-maven-$MVN_VERSION /opt/maven
ENV MAVEN_HOME /opt/maven
ENV PATH ${MAVEN_HOME}/bin:$PATH

COPY install_eclipse.sh ./install_eclipse.sh
RUN ./install_eclipse.sh

RUN curl -O http://heanet.dl.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar
RUN java -Dvim.files=$HOME/.nvim -Declipse.home=$HOME/eclipse -jar eclim_2.4.1.jar install && rm $HOME/eclim_2.4.1.jar
