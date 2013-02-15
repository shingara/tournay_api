# Tournay API #

This project is an API to play the board game [Tournay](http://boardgamegeek.com/boardgame/105037/tournay)

This game is Pearl Games

## Development ##

This developement is do on a virtual machine manage by vagrant and
chef-solo. You can prepare the installation by

```
bundle install --gemfile=Gemfile.vagrant
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
