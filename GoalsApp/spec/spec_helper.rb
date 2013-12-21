# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end


def create_user
  visit new_user_url
  name = Faker::Internet.user_name
  fill_in('username', with: name )
  fill_in('password', with: Faker::Internet.password )
  click_button('Create new user!')
  User.find_by_username(name)
end

def create_goal(title, body, public_or_private, category = 'main')
  fill_in('title', with: title)
  fill_in('body', with: body)
  choose(public_or_private)
  click_button('Create goal')
  Goal.find_by_title(title)
end

def edit_goal(title, body, public_or_private, complete_or_incomplete)
  fill_in('title', with: title)
  fill_in('body', with: body)
  choose(public_or_private)
  check(complete_or_incomplete)
  click_button('Edit goal')
end

def create_category
  visit new_category_url
  fill_in("Name", with: "main")
  click_button("Create category")
end