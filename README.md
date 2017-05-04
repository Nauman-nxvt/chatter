# Chatter

Chatter is a chat application built in Ruby on rails.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites


Rails version: Rails 5.0.2

Ruby version:  ruby 2.3.1p112

Install Qt, a dependancy for capybara-webkit gem

*https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit


### Installing

Initiate a git repo, add remote and pull from git repo:

```
git init
git remote add origin git@github.com:Nauman-nxvt/chatter.git 
git pull origin master
```

Run bundle

```
bundle install
```
Run migrations

```
rake db:migrate
```
Update crontab, which will run the rake tasks
```
whenever --update-crontab

```


## Faye server

Rackup the connection to the Faye server, using the rackup file that the gem generates. In another terminal window in the root directory of your app, run:

```
rackup private_pub.ru -s thin -E production
```


