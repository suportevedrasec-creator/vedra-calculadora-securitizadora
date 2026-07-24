FROM nginx:alpine

# Copia o site estático para o diretório servido pelo nginx
COPY index.html /usr/share/nginx/html/index.html
COPY logo.png /usr/share/nginx/html/logo.png
COPY logo-branco.png /usr/share/nginx/html/logo-branco.png

# Railway injeta a porta via variável $PORT — geramos a config do nginx no start
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 8080
CMD ["/bin/sh","-c","envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
