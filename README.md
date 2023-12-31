# Inception
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

<p align="center">
<img src="https://deploybot.com/assets/guides/_740x345_crop_center-center/docker-head-big@2x.png">
</p>

A project focused on learning about containers and how to build your own docker images by setting up an infrastructure composed of wordpress, nginx, and mariadb from the ground up.

**Final Grade**: <a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cl5zpz90q000609l63hare0gx/project/3142136" alt="lfarias-'s 42 Inception Score" /></a>

### Prerequisites

- A linux virtual machine
- [docker](https://www.docker.com/)
- [docker compose](https://docs.docker.com/compose/)
- [makefile](https://www.gnu.org/software/make/)

## Getting Started

```git
git clone https://github.com/Leofariasrj25/inception42 && cd inception42
```
- open `./srcs/.env` in a text editor of your choice and [add your credentials](#credentials), save them, close the editor
- run `make build` 
- Access https://localhost:443 (note: the certificate is a self-emitted one, you can ignore the warning)

## Running

- `make build` - will do all the heavy lifting of building the images, starting the containers, and other required configurations.
once everything is set up a website can be accessed at https://localhost:443

- `make start` - restart the infrastructure

- `make stop` - will stop all the containers, they can be reactivated with `make start`

## <a id="credentials"> Add your Credentials
Even if this is a student project, you should never expose your API keys and credentials to the world if they grant access to sensitive data. [more info on this topic](https://www.freecodecamp.org/news/how-to-securely-store-api-keys-4ff3ea19ebda).
To follow this, the .env file located in ./srcs/ has only the environment variables, feel free to remove the comments and add the values that make the most sense to you.
Make sure the values in DATA_DIR, DB_DIR, WWW_DIR, AD_DIR in `Makefile` are the same as VOLUME_DB_PATH, VOLUME_WWW_PATH, VOLUME_DBADMIN_PATH in the `.env` file

## Deep-dive

### Mandatory 
<p align="center">
  <img src="https://github.com/Leofariasrj25/inception42/assets/490730/1c7310dc-66fd-4d01-afc3-5299c74c2826" width=580>
</p>

### Bonus
<p align="center">
  <img src="https://github.com/Leofariasrj25/inception42/assets/490730/25b2b7ad-0068-4e3b-a848-978a32921165">
</p> 

## Authors

  - **Leonardo Farias** -
    [leofariasrj25](https://github.com/Leofariasrj25/)


## Acknowledgments

  - My good friend [dvargas1](https://github.com/dvargas1) helped me a lot by providing directions and tips on how to tackle the project. 
