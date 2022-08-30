# https://qiita.com/ntatsuya/items/ef8f48d5e482d4b0f100

# FROM korosuke613/ubuntu-texlive-ja:latest
FROM ubuntu:20.04
# FROM ubuntu-latex:latest

# ARG PASSWD
# RUN apt-get update && apt-get install -y --no-install-recommends wget
RUN apt-get update && apt-get install -y --no-install-recommends wget build-essential libreadline-dev \ 
libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev libffi-dev \
libdb-dev
# RUN apt-get install -y --no-install-recommends openssh-server

# 必要そうなものをinstall
# RUN apt-get update && apt-get install -y \
#     git \
#     cpanminus \
#     texlive-extra-utils \
#     texlive-bibtex-extra biber \
#     make \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*


RUN wget --no-check-certificate http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
&& tar xvf install-tl-unx.tar.gz \
&& cd install-tl-2* \
&& echo i | ./install-tl -no-gui -repository http://mirror.ctan.org/systems/texlive/tlnet/ \
&& cd /root \
&& /usr/local/texlive/????/bin/*/tlmgr path add

#サイズ削減のため不要なものは削除
RUN apt-get autoremove -y

COPY ./.latexmkrc /root/.latexmkrc

RUN mkdir /root/class_documents
# CMD ["/bin/bash"]