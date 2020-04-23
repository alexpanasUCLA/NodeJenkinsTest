FROM node:alpine

EXPOSE 3000

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . . 

CMD ["node", "app.js"]
