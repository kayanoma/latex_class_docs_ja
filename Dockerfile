FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends wget build-essential libreadline-dev \ 
libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev zlib1g-dev uuid-dev libffi-dev \
libdb-dev

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