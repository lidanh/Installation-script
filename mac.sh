#!/usr/bin/env zsh

echo "Installing oh-my-zsh for a better terminal"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Config symlink to Sublime Text 2 ..."
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

sh dotfiles.sh

echo "Config git ..."
  git config --global user.name "Lidan Hifi"
  git config --global user.email "euroil@gmail.com"

echo "Checking for SSH key, generating one if it doesn't exist ..."
  [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa

echo "Copying public key to clipboard. Paste it into your Github account ..."
  [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
  open https://github.com/account/ssh

echo "Installing Homebrew ..."
  /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
  brew update

echo "Put Homebrew location earlier in PATH ..."
  echo "
# recommended by brew doctor
export PATH='/usr/local/bin:$PATH'" >> ~/.zshrc
  source ~/.zshrc

echo "Installing Postgres ..."
  brew install postgres --no-python

echo "Installing ack, a good way to search through files ..."
  brew install ack

echo "Installing QT, used by Capybara Webkit for headless Javascript integration testing ..."
  brew install qt

echo "Installing RVM (Ruby Version Manager) ..."
  curl -L https://get.rvm.io | bash -s stable --ruby
  
exec zsh

echo "Installing Ruby 1.9.3 stable and making it the default Ruby ..."
  rvm install 1.9.3
  rvm use 1.9.3 --default

echo "Installing Rails to write and run web applications ..."
  gem install rails --no-rdoc --no-ri

echo "Installing the Heroku gem to interact with the heroku API ..."
  gem install heroku --no-rdoc --no-ri

echo "Installing the Taps gem to push and pull SQL databases between development, staging, and production environments ..."
  gem install taps --no-rdoc --no-ri

echo "Installing the pg gem to talk to Postgres databases ..."
env ARCHFLAGS="-arch x86_64" gem install --no-ri --no-rdoc pg -- --with-pg-config=/usr/local/Cellar/postgresql/9.1.4/bin/pg_config

echo "Installing the foreman gem for serving your Rails apps in development mode ..."
  gem install foreman --no-rdoc --no-ri

echo "Installing the heroku-accounts plugin for using multiple Heroku accounts..."
  heroku plugins:install git://github.com/ddollar/heroku-accounts.git

echo "Installing the heroku-config plugin for pulling config variables locally to be used as ENV variables ..."
  heroku plugins:install git://github.com/ddollar/heroku-config.git

exec zsh

echo "Completed successfuly!"