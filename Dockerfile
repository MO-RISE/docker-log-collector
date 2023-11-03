FROM ubuntu:latest

# Install required packages for adding the Docker APT repository
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg

# Add the Docker APT repository
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install only the docker-ce-cli package
RUN apt-get update && \
    apt-get install -y docker-ce-cli

# Add the docker-log-collector script
COPY docker-log-collector /usr/local/bin/docker-log-collector
RUN chmod +x /usr/local/bin/docker-log-collector

# Specify the entry point for your script
ENTRYPOINT ["docker-log-collector"]