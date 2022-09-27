# QSample Server

## Download

The latest version of this repository can be downloaded this way:

```
git clone --depth 1 --recurse-submodules https://github.com/proteomicsunitcrg/qsample-server
```
You can retrieve further updates with:

```
git pull --recurse-submodules 
```

## Configuration file

Change the important things like the port, SQL credentials, FlyWay, QSample local mode, APIs URL and much more in the configuration file `src/main/resources/application.yml`.

## Execution with docker-compose

The easiest way to run Qsample is with [Docker compose](https://github.com/docker/compose) (you need also Docker installed in your system)

```
# Adapt docker-compose.yml file with the paths and the configuration file that fits your system
# This will start both a MariaDB/MySQL instance and a web server instance
# Start the system
docker compose up
# Stop the system
docker compose down
```

NOTE: Depending on your installation, it can be either ``docker compose`` or ``docker-compose``

NOTE: If you perform several changes, you might want to rebuild the image with ``docker compose build --no-cache``


### Only server component

You can a use a server-only component as well.
```
# Adapt docker-compose.yml file with the paths and the configuration file that fits your system
# This will start both a MariaDB/MySQL instance and a web server instance
# Start the system
docker compose up -f Dockerfile.dev
# Stop the system
docker compose down -f Dockerfile.dev
```


## Manual installation

### Requirements

Install **Java 1.8** or higher. Other java open source *should* work.

Install **Maven** to install packages, libraries to the project and compile the project.

Install the latest version of **MySQL**.


### Starting the dev server

I personally use the following official Spring Boot Visual Studio Code extensions to manage the project:
1. Spring Boot Extension Pack
2. Spring Boot Tools

I think that you have to put the JAVA PATH if the IDE asks for it and then this should appear on your VSC explorer tab:

![startSpringBootLocal](https://user-images.githubusercontent.com/1679820/137739707-1e68d2fc-4b06-42af-ab42-a21a8107efd5.png)

Right-click on the project and start to run the server. And everything *should* work.

## Compile the project

Change the version in the `pom.xml` file and with maven installed launch the following command:

Edit and change `pom.xml` version

Comment `$JAVA_HOME` at `.bashrc"

`mvn package -DskipTests -f pom.xml`

Obviously change the paths.

This will generate a .jar file named with the POM version saved at `target` folder.

## Deploy the project

Send the jar to the server:

`scp target\QSample-XXXXX.jar admin@10.102.1.26:/home/admin/qsampletest/latest`

Connect to the server, go to the qsample directory and launch the next command to stop the daemon:

`sudo systemctl stop qsample`

Make a database backup:

`mysqldump  --user admin -pPASSWORDHERE qsample > home/admin/sq;lqsample.sql`

Move the old `qsample-latest.jar` to `qsample-latest.old.jar`

Change the name of the new jar to `qsample-latest.jar` and launch the following command:

`sudo systemctl start qsample`

Wait a minute and the new backend *should* work.

To know how to deploy the front end check the [QSample-Client](https://github.com/proteomicsunitcrg/qsample-client/) repository.

## Errors

Sometimes when you start the server at prod it appears to work (systemctl status returns green code) but at the reality the front-end can't establish connection.

Here I stop the daemon (`sudo systemctl stop qsample`) and I launch the jar with "manually" to check the logs easily:

`/usr/bin/java -jar -Dspring.profiles.active=test|prod /home/admin/qsampletest/latest/qsample-latest.jar`

With hibernate ddl mode in validate the deployment will fail if the database schema is not the same in the Java entities. Just update the SQL schema. This happens when you add a field to a table or something like that and you don't create a new migration file with the changes. With update mode the .jar file updates the database and everything works without any problem.


## References

* [Getting started with Spring Boot](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html)
* [Spring Boot with Visual Studio Code](https://code.visualstudio.com/docs/java/java-spring-boot)

---

Document created by *[Marc](mailto:vesperon51@gmail.com)* with [love](https://i.imgur.com/sifK6ru.jpg).

4/10/2021
