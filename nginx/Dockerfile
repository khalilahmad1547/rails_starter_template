FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY server.crt /etc/nginx/server.crt
COPY server.key /etc/nginx/server.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]