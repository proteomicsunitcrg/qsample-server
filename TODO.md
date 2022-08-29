* Generarte multistep Dockerfile
	* Qsample-sever. Maven compile. 
	* Qsample-client. Generate dist and copy to server process 
	* Provide recipe to use under a nginx?
* Generate docker-compose.yml
	* MySQL
	* Qsample-server from above
	* Move application.yml as a volume for further config: https://stackoverflow.com/questions/46057625/externalising-spring-boot-properties-when-deploying-to-docker
