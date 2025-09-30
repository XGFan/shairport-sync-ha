FROM docker.test4x.com/xgfan/shairport-sync:0.0.15

RUN rm -rf /etc/s6-overlay/s6-rc.d/user/contents.d/syslogd-bundle
RUN apk update && apk add alsa-utils alsaconf alsa-plugins-pulse curl pulseaudio-utils jq
COPY run.sh /run.sh
RUN chmod +x /run.sh
COPY shairport-sync.conf /etc/shairport-sync.conf

CMD [ "/run.sh" ]