# Tournay API #

This project is an API to play the board game [Tournay](http://boardgamegeek.com/boardgame/105037/tournay)

This game is Pearl Games

## Development ##

[![Build Status](https://travis-ci.org/shingara/tournay_api.png)](https://travis-ci.org/shingara/tournay_api)
[![Code Climate](https://codeclimate.com/github/shingara/tournay_api.png)](https://codeclimate.com/github/shingara/tournay_api)
[![Dependency Status](https://gemnasium.com/shingara/tournay_api.png)](https://gemnasium.com/shingara/tournay_api)
[![Coverage Status](https://coveralls.io/repos/shingara/tournay_api/badge.png?branch=master)](https://coveralls.io/r/shingara/tournay_api)


This developement is do on a virtual machine manage by vagrant and
chef-solo. You can prepare the installation by installing Vagrant on
your system by downloading from : http://downloads.vagrantup.com/

Install Berkshelf

```
gem install berkshelf-vagrant
vagrant plugin install berkshelf-vagrant
```

Start the virtual machine
```
vagrant up
vagrant ssh
cd /vagrant
./script/setup.rb
```

Your environement is now up. You can launch all test by :

```
./bin/rspec
```

You can also launch a guard :

```
./bin/guard
```


Happy Hacking
