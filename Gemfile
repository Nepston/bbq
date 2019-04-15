source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
gem 'uglifier', '>= 1.3.0'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails'
gem 'carrierwave'
gem 'carrierwave-i18n'
gem 'rmagick', '~> 3.0.0'
gem 'lightbox-bootstrap-rails', '5.1.0.1'
gem 'sass-rails', '~> 5.0'
gem 'fog-aws'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'pundit', '~> 2.0', '>= 2.0.1'

gem 'resque', '~> 2.0'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 3.4'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
  #gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-resque', '~> 0.2.3', require: false

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :production do
  gem 'pg'
end
