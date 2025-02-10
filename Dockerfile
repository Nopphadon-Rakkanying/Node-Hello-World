FROM node:23-alpine3.20 AS build
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY . .

FROM node:23-alpine3.20
WORKDIR /app
COPY --from=build /app/package*.json ./
COPY --from=build /app/src ./src
COPY --from=build /app/node_modules ./node_modules
EXPOSE 3000
CMD [ "npm", "run", "start"]