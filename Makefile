# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfarias- <lfarias-@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/13 02:20:57 by lfarias-          #+#    #+#              #
#    Updated: 2023/07/15 18:52:51 by lfarias-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 		= 	inception

FILE 		= 	./srcs/docker-compose.yml

DATA_DIR 	= 	$(HOME)/data
WWW_DIR 	=	$(addsuffix /www/, $(DATA_DIR))
DB_DIR 		=	$(addsuffix /database/, $(DATA_DIR))

SERVICES  	= 	wordpress mariadb nginx

all: build

${NAME}: build

build: ${FILE}
	@mkdir -p ${WWW_DIR}
	@mkdir -p ${DB_DIR}
	@docker compose -f ${FILE} up -d --build

start: ${FILE}
	@docker compose -f ${FILE} start

stop: ${FILE}
	docker compose -f ${FILE} stop

status: ${FILE}
	@docker compose -f ${FILE} ps 
	@echo "---"
	@docker stats --no-stream ${SERVICES}

logs:
	@$(eval CONTAINERS := $(filter-out $@,$(MAKECMDGOALS)))
	@docker compose -f ${FILE} logs --tail 50 --follow --timestamps ${CONTAINERS} 

run:
	@$(eval CONTAINER := $(filter-out $@,$(MAKECMDGOALS)))
	@docker exec -it ${CONTAINER} /bin/bash 

re: fclean build

clean: ${FILE}
	docker compose -f ${FILE} down

fclean: 
	@docker compose -f ${FILE} down --rmi "all" --volumes
	@sudo rm -rf ${WWW_DIR}
	@sudo rm -rf ${DB_DIR}

.PHONY: all inception build start status run clean fclean re
