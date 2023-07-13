# Inception
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

<img src="https://deploybot.com/assets/guides/_740x345_crop_center-center/docker-head-big@2x.png">

A project focused on learning about containers and how to build your own docker images by setting up an infrastructure composed of wordpress, nginx, and mariadb from the ground up.

### Prerequisites

- A linux virtual machine
- [docker](https://www.docker.com/)
- [docker compose](https://docs.docker.com/compose/)
- [makefile](https://www.gnu.org/software/make/)

## Getting Started

```git
git clone https://github.com/Leofariasrj25/inception42 && cd inception42 && make build
```
- Access https://localhost:443 (note: the certificate is a self-emitted one, you can ignore the warning)

## Running

- `make build` - will do all the heavy lifting of building the images, starting the containers, and other required configurations.
once everything is set up a website can be accessed at https://localhost:443

- `make start` - restart the infrastructure

- `make stop` - will stop all the containers, they can be reactivated with `make start`

## Deep-dive

[In-progress]

## Authors

  - **Leonardo Farias** -
    [leofariasrj25](https://github.com/Leofariasrj25/)


## Acknowledgments

  - My good friend [dvargas1](https://github.com/dvargas1) helped me a lot by providing directions and tips on how to tackle the project. 
