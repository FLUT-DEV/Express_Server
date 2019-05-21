FROM node:8
MAINTAINER LeeJinYoung <wlsdud2194@gmail.com>

WORKDIR /var/run/src

# init install
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install sudo
RUN apt-get install -y curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn

COPY . .

EXPOSE ${PORT}

CMD ["yarn", "start"]