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
gem 'bundler'
gem 'jbuilder'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'paperclip'
gem 'searchkick'
gem 'kaminari'
gem 'sprockets-rails'
gem 'friendly_id'
gem 'sidekiq'
gem 'redis-rack-cache'
gem 'redis-rails'

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'pry'
  gem 'awesome_print'
  gem 'spring-watcher-listen'
  # gem 'rack-mini-profiler'
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
