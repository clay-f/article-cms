ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/autorun"

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
