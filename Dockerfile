FROM  node:10 as node
  WORKDIR /app
 # RUN git clone https://github.com/hwiaufmt/internetbanking.git
  COPY package.json /app/
  RUN npm i npm@latest -g
  RUN npm install
  COPY ./ /app/
  ARG env=prod
  RUN npm run build

 FROM nginx:1.13
  COPY --from=node /app/dist/meu-projeto /usr/share/nginx/html
  COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
