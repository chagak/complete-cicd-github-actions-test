# Use base image
FROM amazonlinux

# Install the dependencies
# in this case we are installing Apaches and Git
RUN yum update -y &&\
    yum install -y httpd &&\
    yum install git -y &&\
    yum clean all

# clone the website
RUN git clone https://github.com/chagak/honey-static-webapp.git &&\
    cp -r honey-static-webapp/* /var/www/html/ &&\
    rm -rf honey-static-webapp

# Expose port for our application
EXPOSE 80

# Command that will run when the container start
# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

