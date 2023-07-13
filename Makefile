# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfarias- <lfarias-@student.42.rio>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/13 02:20:57 by lfarias-          #+#    #+#              #
#    Updated: 2023/07/13 02:38:36 by lfarias-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build

build: 
	docker compose up -d --build

start:
	docker compose start

stop:
	docker compose stop
