# Thalie #

## Descrption ##
Thalie is a Ruby On Rails' project made by Epita student for testing this new tech.

This Project permits to manage teams working on projects.

## Sources ##
The sources of this project are on the svn.
Thalie was developped on assembla, because that offer lots of tools.
Go on [Assembla](http://www.assembla.com/wiki/show/Epita-RoR) to see it.

## Installation ##
wget http://thalie.googlecode.com/files/Thalie.rar

unrar x Thalile.rar

cd Thalie

export RAILS\_ENV="production"

rake db:create

rake db:migrate

ruby script/server -e production


---


When the server is launched, the member named 'root' was added to the database.
We can login with it (email, password).
The password can be changed when we'll be loged in.
### root ###
  * last\_name: root
  * first\_name root
  * password: root
  * email: root@localhost.com

## Required ##
  * ruby 1.8
  * rubygems
  * MySql
  * Rails 2.0.1