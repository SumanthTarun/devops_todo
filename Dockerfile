# Build Stage: Install dependencies
FROM node:16 AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .

# Production Stage: Use a smaller image for the app
FROM node:16-slim

WORKDIR /app
COPY --from=build /app /app

CMD ["npm", "start"]
