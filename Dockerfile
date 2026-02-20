FROM nginx:1.17-alpine
RUN apk --no-cache add gettext
COPY ./docker/nginx.conf /etc/nginx/nginx.template
CMD ["/bin/sh", "-c", "export PORT=${PORT:-80} && envsubst '$PORT' < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
COPY ./src /usr/share/nginx/html
