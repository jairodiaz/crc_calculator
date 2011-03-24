# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.sequence :email do |n|
  "email#{n}@example.com"
end

Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each {|f| require f}
