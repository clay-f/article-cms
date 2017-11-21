source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'pry', '~> 0.11.3'
  gem 'awesome_print'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'sqlite3'
  gem 'minitest', '~> 5.10', '>= 5.10.3'
end

group :production, :staging do
  gem 'pg', '~> 0.21.0'
end

gem 'rails', '~> 5.1.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem "paperclip"
gem 'simple_form'
gem 'searchkick', '~> 2.4'
gem 'will_paginate'
gem 'redcarpet'
gem 'coderay', '~> 1.1', '>= 1.1.1'
gem 'will_paginate-bootstrap'
gem "factory_bot_rails", "~> 4.0"
gem 'trix', '~> 0.10.1'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'