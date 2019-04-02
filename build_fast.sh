#!/bin/bash

sh pg-restart.sh

# echo '----------------------------'
# echo 'gem install bundler -v 1.7.3'
# gem install bundler -v 1.7.3

# echo '----------------------------'
# echo 'gem install byebug -v 11.0.1'
# gem install byebug -v 11.0.1

# echo '--------------------------'
# echo 'gem install puma -v 3.12.1'
# gem install puma -v 3.12.1

sh kill_spring.sh
sh all.sh
