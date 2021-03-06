## Objective
The objective of this lesson is get the lab's source code up and running, seed the application with dagta and then check to make sure that the data seeding was successful.

## Steps

**Step 1:** Confirm that you're in the lab's working directory

`cd ~/simplecqrs && pwd`{{execute T1}}

You'll get the following output:

`/root/simplecqrs`

**Step 2:** Install the application's dependencies

`npm install`{{execute T1}}

You'll get output similar to the following:

```
.
.
added 310 packages from 693 contributors and audited 312 packages in 13.596s

26 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

```

**Step 3:** Install the application's backing servicew which are a single relational database, [`MariaDB`](https://mariadb.org/) and a document database, [`MongoDB`](https://www.mongodb.com/2). All the backing services throughout the lessons will run as an aggregation of containers under [`docker-compose`](https://docs.docker.com/compose/).

`docker-compose -f docker-compose-debug.yml up -d`{{execute T1}}

**Step 4:** Confirm that the Docker containers are up and running:

`docker ps -a`{{execute T1}}

You'll get output similar to the following:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
ab742a7799f8        mongo:latest        "docker-entrypoint.s…"   26 seconds ago      Up 25 seconds       0.0.0.0:27017->27017/tcp   mongodb
5604590b92c8        mariadb             "docker-entrypoint.s…"   26 seconds ago      Up 23 seconds       0.0.0.0:3306->3306/tcp     simplecqrs_mariadb_1
6ef296705d36        adminer             "entrypoint.sh docke…"   26 seconds ago      Up 25 seconds       0.0.0.0:8080->8080/tcp     simplecqrs_adminer_1
4eb352ced8e9        registry:2          "/entrypoint.sh /etc…"   4 minutes ago       Up 3 minutes                          registry

```

**Step 5:** Export the environment variable that declares the port on which the application is to run.

`export APP_PORT=9001`{{execute T1}}

**Step 6:** Export the environment variable that declares URL on which the read source is running. (We'll cover the reasoning behind using separate read and write datasources in the following lessons.)

`export MONGODB_URL=mongodb://localhost:27017/simplecqrs_r`{{execute T1}}

**Step 7:** Start the application

`npm start`{{execute T1}}

You'll get the following output

```
connected
Read database connected at Wed Dec 30 2020 04:12:31 GMT+0000 (Coordinated Universal Time)
server is listening on 9001

```

**Step 8:** In a second terminal window, seed the application with data

`cd simplecqrs && npm run seed`{{execute T2}}

You'll get output similar to the following:

```
Seeded {"count":0,"customerEmail":"Katheryn.Batz@nels.info","customerFirstName":"Katheryn","customerLastName":"Batz","description":"eum sit atque earum"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":8,"customerEmail":"Lavonne.Kemmer@adolph.com","customerFirstName":"Lavonne","customerLastName":"Kemmer","description":"veritatis voluptas sint repellat"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Christop.Kilback@myrna.org","customerFirstName":"Christop","customerLastName":"Kilback","description":"aut rerum quas hic"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":8,"customerEmail":"Cielo.O'Hara@janet.info","customerFirstName":"Cielo","customerLastName":"O'Hara","description":"explicabo aut ut dicta"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Abbigail.Welch@murl.name","customerFirstName":"Abbigail","customerLastName":"Welch","description":"aliquid iste aspernatur natus"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":10,"customerEmail":"Henriette.DuBuque@ezra.org","customerFirstName":"Henriette","customerLastName":"DuBuque","description":"voluptatem nihil unde ut"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":2,"customerEmail":"Vivianne.Dibbert@westley.org","customerFirstName":"Vivianne","customerLastName":"Dibbert","description":"nemo est id molestiae"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":9,"customerEmail":"Hallie.Thiel@collin.info","customerFirstName":"Hallie","customerLastName":"Thiel","description":"cupiditate saepe dolores reprehenderit"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Stephanie.Jones@martine.net","customerFirstName":"Stephanie","customerLastName":"Jones","description":"dolorum beatae repellendus nesciunt"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":2,"customerEmail":"Sarah.Hyatt@joannie.net","customerFirstName":"Sarah","customerLastName":"Hyatt","description":"inventore consequatur qui aut"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
```

**Step 9:** Click the following link to verify that the data seeding has been successful.

https://[[HOST_SUBDOMAIN]]-9001-[[KATACODA_HOST]].environments.katacoda.com/orders

You'll get output similar to the following:

![orders output](msdb-003/assets/orders.png)

---

***Next: Analyzing the Application***