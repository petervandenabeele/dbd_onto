require 'dbd_onto'

# load all support files
root = File.expand_path('../', __FILE__)
Dir[root + '/support/**/*.rb'].each {|f| require f}

RSpec.configure do |config|
  config.order = 'random'
end
