FROM node:6.9.2-alpine
MAINTAINER Steve Jabour <steve@jabour.me>

RUN mkdir -p /var/www/app

WORKDIR /var/www/app

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["npm", "start"]
