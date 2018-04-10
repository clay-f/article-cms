source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production, :staging do
  gem 'pg'
end

gem 'rails'
gem 'puma'
gem 'sass-rails'
gem 'bootsnap'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jquery-rails'
gem 'bundler'
gem 'jbuilder'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'paperclip'
gem 'searchkick'
gem 'kaminari'
gem 'bootstrap'
gem 'sprockets-rails'
gem 'friendly_id'
gem 'sidekiq'
gem 'redis-rack-cache'
gem 'redis-rails'

group :development do
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring'
  gem 'pry', '~> 0.11.3'
  gem 'awesome_print'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'rack-mini-profiler'
end

group :development, :test do
  gem 'faraday'
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'pry-byebug'
  gem "factory_bot_rails"
  gem 'minitest'
  gem 'faker'
end
