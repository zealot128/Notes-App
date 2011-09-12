restart:
	rake assets:precompile
	chown www-data tmp -R
	touch tmp/restart.txt
