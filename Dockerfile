# Utilisez une image légère d'un serveur web
FROM nginx:alpine

# Copiez les fichiers du site web dans le répertoire de travail de l'image
COPY . /usr/share/nginx/html
COPY ./js /usr/share/nginx/html/js
COPY ./css /usr/share/nginx/html/css
COPY ./scss /usr/share/nginx/html/scss
COPY ./images /usr/share/nginx/html/images

# Exposez le port 80 pour accéder au site web
EXPOSE 80

# Commande pour démarrer le serveur Nginx
CMD ["nginx", "-g", "daemon off;"]
