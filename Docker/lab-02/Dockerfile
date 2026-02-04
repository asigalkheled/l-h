FROM alpine:3.19
RUN apk add --no-cache python3
WORKDIR /app
COPY index.html .
ENV PORT=5022
EXPOSE 5022
CMD ["sh", "-c", "python3 -m http.server $PORT"]
