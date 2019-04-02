#!/bin/bash

echo '---------------------'
echo 'gem uninstall bundler'
gem uninstall bundler

echo '-----------------------------'
echo 'gem install bundler -v 1.17.3'
gem install bundler -v 1.17.3

sh pg-restart.sh

echo '--------------'
echo 'bundle install'
bundle install

# echo '----------------'
# echo 'rails db:migrate'
# rails db:migrate

# NOTE: The Spring server may distort the test coverage results from MiniTest and SimpleCov.
# echo '---------------------------'
# echo 'DISABLE_SPRING=1 rails test'
# DISABLE_SPRING=1 rails test

