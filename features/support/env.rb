# Generated by cucumber-sinatra. (2015-06-03 13:59:26 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = TwentyQuestions

class TwentyQuestionsWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  TwentyQuestionsWorld.new
end
