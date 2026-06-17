FROM nginx:alpine

# Herramienta para templating de Nginx con variables de entorno
RUN apk add --no-cache gettext

# Limpia contenido por defecto
RUN rm -rf /usr/share/nginx/html/*

# Copia los archivos del frontend
COPY index.html app.js /usr/share/nginx/html/

# Copia la plantilla de configuración custom de Nginx
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]