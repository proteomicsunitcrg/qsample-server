# QSample Server

![AngularJS](https://img.shields.io/badge/AngularJS-E23237?style=for-the-badge&logo=angularjs&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-F2F4F9?style=for-the-badge&logo=spring-boot)

## Introduction

**QSample Server** is a generic name to label the repository where all the front-end code for the QSample project is stored. Strictly speaking it is much more than that: it contains the QSample presentation layer which is called the **[QSample Client](https://github.com/proteomicsunitcrg/qsample-client)**, the **QSample Server** itself which is the layer inbetween the presentation and database, and finally, the database schema. For managing this three components a [Docker Compose](https://github.com/proteomicsunitcrg/qsample-server/blob/master/docker-compose.default.yml) file has been created. It provides a seamless way to build and run all the components. The QSample Server and the [atlas pipleline](https://github.com/proteomicsunitcrg/atlas) form the QSample project:  

![Screenshot from 2023-07-24 16-30-48](https://github.com/proteomicsunitcrg/qsample-server/assets/1679820/5e13185c-72b4-4f8e-9fda-93738a64c9ba)

## Quick Start

1. Clone the github repo: `git clone --recurse-submodules git@github.com:proteomicsunitcrg/qsample-server.git`
2. Modify [docker-compose.default.yml](https://github.com/proteomicsunitcrg/qsample-server/blob/master/docker-compose.default.yml) file according you server configuration.
3. Modify [application.yml](https://github.com/proteomicsunitcrg/qsample-server/blob/master/src/main/resources/application.yml) file according you server configuration.
4. Build `docker compose build --no-cache`
5. Run `docker compose -f docker-compose.yml up -d`

For more detailed documentation check the [wiki](https://github.com/proteomicsunitcrg/qsample-server/wiki/Point-5:-Server-and-Database-installation). 
   
## Credits

**QSample Server** was originally written by Marc Serret, Toni Hermoso and Roger Olivella.

We thank the following people for their assistance in the development of this project:

Eduard Sabidó, Cristina Chiva, Eva Borràs, Guadalupe Espadas, Olga Pastor, Enrique Alonso, Selena Fernández.
