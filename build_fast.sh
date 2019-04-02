#!/bin/bash

echo '---------------------'
echo 'gem uninstall bundler'
gem uninstall bundler

echo '-----------------------------'
echo 'gem install bundler -v 1.17.3'
gem install bundler -v 1.17.3

sh pg_setup.sh

sh kill_spring.sh
sh all.sh
