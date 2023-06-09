FROM alpine:3.17
MAINTAINER radoslav@rstefanov.info

RUN apk update && apk add dcron curl wget rsync ca-certificates docker bash coreutils && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

COPY crontab-*.sh /

ENTRYPOINT ["/crontab-docker-entry.sh"]
CMD ["/crontab-docker-cmd.sh"]
