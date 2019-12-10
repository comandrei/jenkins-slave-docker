FROM openjdk:8-slim-buster
# Install docker
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common python3 python3-pip jq wget
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
# Install awscli
RUN pip3 install awscli
RUN pip3 install docker-compose

RUN apt-get install unzip
#  Install sonar scanner
RUN wget -q -O /tmp/sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip \
    && mkdir -p /opt/sonar \
    && cd /opt/sonar && unzip -q /tmp/sonar-scanner-cli.zip \
    && ln -s /opt/sonar/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner /usr/bin/sonar-scanner \
    && rm -f /tmp/sonar-scanner-cli.zip