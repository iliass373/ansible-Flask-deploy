# base Image --- we use the ubuntu image ---
FROM ubuntu:20.04

# Download && Install Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Configure the root User with its privileges
RUN echo "root:choosePassword123" | chpasswd


# Expose the port && The Command that should be run
EXPOSE 22
CMD ["/usr/bin/sshd", "-D"]