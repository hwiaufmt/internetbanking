FROM  node:10 as node
  WORKDIR /app
  #RUN git clone https://github.com/hwiaufmt/internetbanking.git
  COPY package.json /app/
  RUN npm i npm@latest -g
  RUN npm install
  COPY ./ /app/
  ARG env=prod
  RUN npm run build
