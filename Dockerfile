FROM node:16-alpine AS builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

EXPOSE 80

# Copy the build folder from the previous stage to the nginx folder

COPY --from=builder /app/build /usr/share/nginx/html