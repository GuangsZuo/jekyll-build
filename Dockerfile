# Base
FROM krallin/ubuntu-tini:trusty

# Set the locale
RUN locale-gen en_US.UTF-8
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
# Fix local and timezone
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update

RUN apt-get install -y --force-yes\
  python \
  ruby \
  libxml2-dev \
  curl \
  git \
  wget \
  build-essential \
  automake \
  autoconf \
  openssh-client \
  zlib1g-dev \
  gettext \
  libreadline-dev \
  libssl-dev \
  libffi-dev \
  bison \
  libicu-dev

RUN wget -qO- http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz | tar xvz

RUN cd ruby-2.3.1 && autoconf && ./configure --disable-install-doc && make && make install

RUN gem install --no-ri --no-rdoc bundler
# github-pages 
RUN gem install --no-ri --no-rdoc \
jekyll:3.4.3 \
github-pages-health-check:1.3.3 \
github-pages:138 \
html-pipeline:2.5.0 \
jekyll-avatar:0.4.2 \
jekyll-coffeescript:1.0.1 \
jekyll-default-layout:0.1.4 \
jekyll-feed:0.9.2 \
jekyll-gist:1.4.0 \
jekyll-github-metadata:2.3.1 \
jekyll-mentions:1.2.0 \
jekyll-optional-front-matter:0.1.2 \
jekyll-paginate:1.1.0 \
jekyll-readme-index:0.1.0 \
jekyll-redirect-from:0.12.1 \
jekyll-relative-links:0.4.0 \
jekyll-sass-converter:1.5.0 \
jekyll-seo-tag:2.2.3 \
jekyll-sitemap:1.0.0 \
jekyll-swiss:0.4.0 \
jekyll-theme-architect:0.0.4 \
jekyll-theme-cayman:0.0.4 \
jekyll-theme-dinky:0.0.4 \
jekyll-theme-hacker:0.0.4 \
jekyll-theme-leap-day:0.0.4 \
jekyll-theme-merlot:0.0.4 \
jekyll-theme-midnight:0.0.4 \
jekyll-theme-minimal:0.0.4 \
jekyll-theme-modernist:0.0.4 \
jekyll-theme-primer:0.1.8 \
jekyll-theme-slate:0.0.4 \
jekyll-theme-tactile:0.0.4 \
jekyll-theme-time-machine:0.0.4 \
jekyll-titles-from-headings:0.1.5 \
jemoji:0.8.0 \
kramdown:1.13.2 \
liquid:3.0.6 \
listen:3.0.6 \
minima:2.1.1 \
nokogiri:1.7.2 \
rouge:1.11.1 \
ruby \
safe_yaml:1.0.4 \
sass:3.4.23

RUN gem install --no-ri --no-rdoc \
redcarpet:3.4.0 \
rdiscount:2.2.0.1 \
RedCloth:4.3.2 \
classifier-reborn \
concurrent-ruby \
fast-stemmer \
fastimage \
jekyll-assets \
maruku \
posix-spawn \
pygments.rb \
sprockets \
sprockets-helpers \
tilt \
toml \
yajl-ruby 

COPY ./build.sh /opt

WORKDIR /usr/src/app

CMD ["/opt/build.sh"]
