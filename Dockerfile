FROM fedora:latest

RUN dnf update -y

RUN dnf install ncurses util-linux util-linux-user passwd nano vim git wget -y
