FROM node:13.12.0-alpine as builder

WORKDIR '/app'

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json .
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html