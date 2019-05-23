FROM wlsdud2194/node-inyarn:v1
MAINTAINER LeeJinYoung <wlsdud2194@gmail.com>

WORKDIR /var/run/src

# init install
RUN npm install -g npm && npm install -g yarn

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn

COPY . .

EXPOSE 8888

CMD ["yarn", "start"]
