FROM node:alpine

WORKDIR /app

COPY package*.json .

COPY node-app/* /

RUN npm install

EXPOSE 4000

CMD ["npm", "start"]
