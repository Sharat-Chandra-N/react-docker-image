FROM node as build

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm ci --production

COPY . .
RUN npm run build

FROM nginx as run

COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]