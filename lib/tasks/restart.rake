desc "Restart Server, recompile assets, reset file ownerships"
task :restart do

  Rake::Task['assets:precompile'].invoke
	sh "chown www-data tmp -R"
	sh "touch tmp/restart.txt"
end
