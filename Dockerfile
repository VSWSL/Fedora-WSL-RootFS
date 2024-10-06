FROM fedora:latest

COPY . /

RUN dnf update -y
RUN dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
RUN dnf install @core cracklib-dicts curl dnf-plugins-core dnf-utils findutils git nano ncurses PackageKit-command-not-found passwd sudo util-linux util-linux-user vim wget which -y
RUN dnf groupinstall -y 'Development Libraries' 'Development Tools'
RUN dnf copr enable scaryrawr/mesa-d3d12 -y
RUN dnf update -y
RUN dnf install mesa-dri-drivers mesa-d3d12 mesa-vdpau-drivers -y
RUN git clone https://github.com/scaryrawr/bottle-imp
RUN cd bottle-imp && make internal-systemd internal-binfmt DESTDIR=/usr
RUN rm -rf bottle-imp