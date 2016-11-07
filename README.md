# Software Design Docker Example
An example proof-of-concept for utilizing Docker and software containers in the software design class at UMM.

This example utilizes the angular-fullstack Yeoman generator that was used last year. It has been updated quite a bit since last year's software design class, but is still very similar in the setup.

The Dockerfile included builds Docker containers based on the built application. Thus, the application must be built before running any of these:

```bash
$ gulp build
```

This builds the whole application and throws it in the `dist` directory, which is what the Dockerfile looks for.

## Spin up the production application with seeded database

For demos, it is beneficial to spin up the production version of the application with a seeded, clean database. We've created a simple Docker compose for this:

```bash
$ docker-compose up
```

This runs the default `docker-compose.yml` and spins up the production environment. Visit [http://localhost:8080][local] to see the production application running. There should be six things listed under "features", as the database has been seeded. Note that the database and server are running in two different containers. Yay!

## Attaching to an already-made database

Obviously, using a seed database all the time is not all that useful. Maybe we want to spin up a container with a database and connect our website to it.

First, create a Docker network to connect the two containers:

```bash
$ docker network create -d bridge softwaredesignexample_external
```

Next, spin up a new Mongo container and connect it to this network:

```bash
$ docker run --network=softwaredesignexample_external -itd --name=mongo_1 mongo
```

Next, run our external Docker Compose file which also attaches to this network and and can talk to our new mongo:

```bash
$ docker-compose -f docker-compose-external-db.yml up
```

Visit [http://localhost:8080][local] to see the hosted website. There should be no "features" listed, because the newly created database is empty (rather than seeded as before).

[local]: http://localhost:8080
