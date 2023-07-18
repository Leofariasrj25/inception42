#!/bin/sh

tar -xf /var/www/site.tar 
cd /var/www/cvless
bundle

exec bundle exec jekyll serve --host=0.0.0.0
