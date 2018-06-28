# README

1. Run 'bundle' for the gemfile

2. Create a file called .env and it should look something like this:

  JWT_SECRET=asdfasdfjhadjklfhdaks;lfjdjklafhkds

3. Run 'rake db:create db:migrate db:seed' to get the seed data
# Or if you want to recreate the databases for this project:
# rake db:drop db:create db:migrate db:seed

4. Run 'rails s' to start the application
# Or to run on a different port:
# rails s -p 5000
