RSpec.configure do |config|

# before test runs truncate database - clean it out
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

# before all non javascript tests run, run everything within a transaction
# create data then rollback transaction
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

# run truncation for js tests
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

# start db cleaner before each test
  config.before(:each) do
    DatabaseCleaner.start
  end

# run after each test to clean database
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
