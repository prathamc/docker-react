
# Step 1 : Build phase
FROM node:alpine as build-phase
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will be created

# Step 2  : Run phase
FROM nginx
COPY --from=build-phase /app/build  /usr/share/nginx/html


