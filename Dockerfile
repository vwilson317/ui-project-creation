ARG TEAMCITY_VERSION

# build stage
FROM node:10-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# production stage
FROM nginx:alpine as production-stage

# default environment variables for local running
ENV LISTEN_PORT="80" UPSTREAM="localhost:32012" UPSTREAM_PROTO="http"

# copy the vue prod build to the prod image
COPY --from=build-stage /app/dist /usr/share/nginx/html
# add our template for an nginx conf
COPY {name}.template /etc/nginx/conf.d/{name}.temp

EXPOSE 80
# render the template conf with the environment variables
CMD envsubst '$$LISTEN_PORT,$$UPSTREAM,$$UPSTREAM_PROTO' < /etc/nginx/conf.d/{name}.temp > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' || cat /etc/nginx/conf.d/default.conf