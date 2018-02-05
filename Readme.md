# Docker Specks
## Dev Specs
* ### centos7
* ### EPEL
* ### REMI
* ### Python3.4
* ### Php7
* ### Apache- /localhost:5000
* ### Composer
* ### Symfony- /localhost:5002

## Databse Specs
* ### MonogoDB - /localhost:27017
* ### Redis -  /localhost:6379

# Commands to run 

to build the application
 ``` 
 docker-composr build
 ```
 to run the docker umage
 ```
 docker-compose exec app /bin/sh
 ```
this will open the commanf prompt of centos7 to run the apace and php aserver
```
./setup.sh
```

## To run the php app on apache make changes to index.php