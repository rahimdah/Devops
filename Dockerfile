# Utilisez une image de Node.js pour construire l'application
FROM node:14 AS builder

# Définissez le répertoire de travail dans l'image Node.js
WORKDIR /app

# Copiez le fichier package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez le reste des fichiers de l'application
COPY . .

# Construisez l'application
RUN npm run build

# Utilisez une image légère d'un serveur web (Nginx)
FROM nginx:alpine

# Copiez les fichiers du site web à partir de l'image du constructeur (Node.js)
COPY --from=builder /app/build /usr/share/nginx/html

# Exposez le port 80 pour accéder au site web
EXPOSE 80

# Commande pour démarrer le serveur Nginx
CMD ["nginx", "-g", "daemon off;"]
