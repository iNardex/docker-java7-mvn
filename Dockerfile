FROM buildpack-deps:bionic-scm

RUN apt-get update && apt-get install build-essential -y

ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        fontconfig \
	unzip \
	openjdk-7-jdk \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.gradle

ENV MAVEN_VERSION 3.6.3

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
