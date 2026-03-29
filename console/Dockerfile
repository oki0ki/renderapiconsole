FROM node:20-alpine AS svelte-build
WORKDIR /app
COPY console/package*.json ./
RUN npm ci
COPY console/ ./
RUN npm run build

FROM golang:1.22-alpine AS go-build
WORKDIR /app
COPY *.go go.mod ./
RUN go build -o gateway .

FROM node:20-alpine
WORKDIR /app
COPY --from=svelte-build /app/build ./svelte
COPY --from=svelte-build /app/package.json ./svelte/
COPY --from=go-build /app/gateway ./gateway
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
EXPOSE 7860
CMD ["./start.sh"]
