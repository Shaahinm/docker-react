FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


# Currently there is a bug with Amazon Linux2 which prevents named builders to be used
# In order to rectify this issue we can use Unnamed Builder syntax

# FROM node:alpine
# WORKDIR '/app'
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# EXPOSE 80
# COPY --from=0 /app/build /usr/share/nginx/html