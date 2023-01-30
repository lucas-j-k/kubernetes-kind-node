FROM node:alpine
WORKDIR /usr/app
COPY package.json .
RUN npm install
RUN npm install -g typescript
COPY . .
RUN npm run build
CMD ["npm", "run", "start"]