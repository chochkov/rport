FROM postgres:12
FROM r-base

RUN apt-get update

# Postgres deps
RUN apt-get install -y postgresql-12 postgresql-client-12 postgresql-contrib-12 postgresql-server-dev-12

# Necessary for devtools
RUN apt-get install -t unstable -y libcurl4-openssl-dev libssl-dev libxml2-dev

VOLUME /build

USER "postgres"

RUN mkdir -p ~/R/library
RUN R --vanilla -e "install.packages('devtools', '~/R/library', repos='http://cran.rstudio.com')"

RUN /etc/init.d/postgresql start

CMD ["bash"]
