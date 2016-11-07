FROM node:6

MAINTAINER Shawn Seymour <seymo079@morris.umn.edu>
MAINTAINER Dan Stelljes <stell124@morris.umn.edu>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib
ENV NODE_ENV=production

COPY *.json /usr/src/app/
RUN npm install
COPY ./dist/ /usr/src/app/

# must match linked container
ENV MONGODB_URI=mongo
ENV SEED_DB=true

CMD ["npm", "start"]

EXPOSE 8080
