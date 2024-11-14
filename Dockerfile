FROM fedora:41

COPY . /

RUN dnf update -y

RUN dnf install ncurses util-linux util-linux-user passwd nano vim git wget @core sqlite pinentry cracklib-dicts -y
