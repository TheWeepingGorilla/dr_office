require 'rspec'
require 'pg'
require 'insurance'

DB = PG.connect({:dbname => 'doctors_office_tools'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM insurance_companies *;")
  end
end

describe Insurance do

  it 'initializes an object of type Insurance.' do
    test_insurance = Insurance.new('Red Shield')
    expect(test_insurance).to be_an_instance_of Insurance
  end

  it 'returns the name and id when asked for it.' do
    test_insurance = Insurance.new('Red Shield')
    expect(test_insurance.name).to eq 'Red Shield'
    expect(test_insurance.id).to eq nil
  end
end
