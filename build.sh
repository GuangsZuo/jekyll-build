#!/bin/bash

if [ -f "/usr/src/app/Gemfile" ]; then
	echo "> /usr/local/bin/bundle install"
	/usr/local/bin/bundle install && /usr/local/bin/bundle exec /usr/local/bin/jekyll build —safe
else
	echo "> /usr/local/bin/jekyll build --safe"
	/usr/local/bin/jekyll build --safe
fi

