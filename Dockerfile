FROM python:2.7-jessie
RUN apt-get install bzip2 xz-utils zlib1g libxml2-dev libxslt1-dev
ADD https://github.com/nexB/scancode-toolkit/releases/download/v2.2.1/scancode-toolkit-2.2.1.tar.bz2 .
RUN mkdir scancode-toolkit && tar xjvf scancode-toolkit-2.2.1.tar.bz2 -C scancode-toolkit --strip-components=1
WORKDIR scancode-toolkit
RUN ./scancode --help 
ENV PATH=$HOME/scancode-toolkit:$PATH
ENTRYPOINT ["scancode"]
