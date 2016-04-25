#!/bin/bash


sudo apt-get install -y curl git

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

cd ~
git clone https://github.com/errbit/errbit
cd errbit

bundle install
bundle exec rake errbit:bootstrap
bundle exec rails server &> /dev/null &
