source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production, :staging do
  gem 'pg', '~> 0.21.0'
end

gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'uglifier', '~> 3.2'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
gem 'bundler', '~> 1.16'
gem 'jbuilder', '~> 2.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'paperclip', '~> 5.1'
gem 'simple_form'
gem 'searchkick', '~> 2.4'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'trix', '~> 0.11'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'
gem 'friendly_id', '~> 5.1.0'
gem 'redis', '~> 4.0', '>= 4.0.1'

group :development do
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring'
  gem 'pry', '~> 0.11.3'
  gem 'awesome_print'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  # gem 'rack-mini-profiler'
end

group :development, :test do
  gem 'poltergeist'
  gem 'faraday', '~> 0.13.1'
  gem 'byebug', platform: :mri
  gem 'capybara', '~> 2.16', '>= 2.16.1'
  gem 'pry-byebug'
  gem 'sqlite3'
  gem "factory_bot_rails", "~> 4.0"
  gem 'minitest', '~> 5.10', '>= 5.10.3'
  gem 'faker', '~> 1.8', '>= 1.8.4'
end