FROM node:6

MAINTAINER Shawn Seymour <seymo079@morris.umn.edu>
MAINTAINER Dan Stelljes <stell124@morris.umn.edu>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git config --global user.name "example"
RUN git config --global user.email example@example.com

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib
ENV NODE_ENV=production

# must match linked container
ENV MONGODB_URI=mongo

RUN git clone https://github.com/devshawn/software-design-example
WORKDIR /usr/src/app/software-design-example

RUN npm config set -g production false
RUN npm install

#CMD ["sleep", "3600"]
CMD git pull && ./node_modules/gulp/bin/gulp.js build && cd dist && npm start

EXPOSE 8080
