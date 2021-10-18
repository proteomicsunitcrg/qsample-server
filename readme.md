# QSample Server

## Install and launch the development environment

### Requirements

Install **Java 1.8** or higher. Other java open source *should* work.

Install **Maven** to install packages, libraries to the project and compile the project.

Install the latest version of **MySQL**.

### Configuration file

Change the important things like the port, SQL credentials, FlyWay, QSample local mode, APIs URL and much more in the configuration file `src/main/resources/application.yml`.

### Starting the dev server

I personally use the following official Spring Boot Visual Studio Code extensions to manage the project:
1. Spring Boot Extension Pack
2. Spring Boot Tools

I think that you have to put the JAVA PATH if the IDE asks for it and then this should appear on your VSC explorer tab:

![startSpringBootLocal](https://user-images.githubusercontent.com/1679820/137739707-1e68d2fc-4b06-42af-ab42-a21a8107efd5.png)

Right-click on the project and start to run the server. And everything *should* work.

## Compile the project

Change the version in the `pom.xml` file and with maven installed launch the following command:

`"f:\projects\qsample-server\mvnw.cmd" package -DskipTests -f "f:\projects\qsample-server\pom.xml"`

Obviously change the paths.

This will generate a .jar file named with the POM version saved at target folder.

## Deploy the project

Send the jar to the server:

`scp target\QSample-XXXXX.jar admin@10.102.1.26:/home/admin/qsample/latest`

Connect to the server, go to the qsample directory and launch the next command to stop the daemon:

`sudo systemctl stop qsample`

Make a database backup:

`mysqldump  --user admin -pPASSWORDHERE qsample > home/admin/sq;lqsample.sql`

Move the old `qsample-latest.jar` to `qsample-latest.old.jar`

Change the name of the new jar to `qsample-latest.jar` and launch the following command:

`sudo systemctl start qsample`

Wait a minute and the new backend *should* work.

To know how to deploy the front end check the [QSample-Client.md](QSample-Client.md) file.

## Errors

Sometimes when you start the server at prod it appears to work (systemctl status returns green code) but at the reality the front-end can't establish connection.

Here I stop the daemon (`sudo systemctl stop qsample`) and I launch the jar with "manually" to check the logs easily:

`/usr/bin/java -jar -Dspring.profiles.active=test|prod /home/admin/qsampletest/latest/qsample-latest.jar`

With hibernate ddl mode in validate the deployment will fail if the database schema is not the same in the Java entities. Just update the SQL schema. This happens when you add a field to a table or something like that and you don't create a new migration file with the changes. With update mode the .jar file updates the database and everything works without any problem.

## References

[Getting started with Spring Boot](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html)

[Proteomics unit daemons](https://github.com/proteomicsunitcrg/general-servers/issues?q=is%3Aissue+is%3Aopen+label%3Adaemon)

[Spring Boot with Visual Studio Code](https://code.visualstudio.com/docs/java/java-spring-boot)

---

Document created by *[Marc](mailto:vesperon51@gmail.com)* with [love](https://i.imgur.com/sifK6ru.jpg).

4/10/2021
