FROM ubuntu:16.04
MAINTAINER Maxime Garcia "max.u.garcia@gmail.com"

# Install pre-requistes
RUN apt-get update && apt-get install -y \
  git
 
# Install some Google Web Fonts
RUN find fonts/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
RUN fc-cache -f -v

# Install the texlive-xetex package which includes the Xelatex executable.
RUN git clone https://github.com/scottkosty/install-tl-ubuntu.git
RUN cd install-tl-ubuntu; ./install-tl-ubuntu