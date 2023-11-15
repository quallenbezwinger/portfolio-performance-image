# Pull base image.
FROM jlesage/baseimage-gui:debian-11-v4.4.0

ENV VERSION 0.65.6
ENV ARCHIVE https://github.com/buchen/portfolio/releases/download/${VERSION}/PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz
ENV APP_ICON_URL=https://www.portfolio-performance.info/images/logo.png
	
	
RUN apt-get update && apt-get install -y wget && \
	cd /opt && wget ${ARCHIVE} && tar xvzf PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz && \
	rm PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz

# Install dependencies.
RUN \
    apt-get install -y \
        openjdk-17-jre \
        libwebkit2gtk-4.0-37 

RUN \
    # Write config entry for new data folder, cause otherwise pp would try to write in /dev which is not possible
    echo "-data\n/config/portfolio\n$(cat /opt/portfolio/PortfolioPerformance.ini)" > /opt/portfolio/PortfolioPerformance.ini && \
	# Set initial language to english
    echo "osgi.nl=en" >> /opt/portfolio/configuration/config.ini && \
	chmod -R 777 /opt/portfolio && \
    install_app_icon.sh "$APP_ICON_URL"

# Copy the start script.
COPY rootfs/ /

# Set the name of the application.
ENV APP_NAME="Portfolio Performance"