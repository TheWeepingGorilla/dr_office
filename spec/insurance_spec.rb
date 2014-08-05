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

  it 'returns all insurance_companies and starts out blank.' do
    test_insurance = Insurance.new('Red Shield')
    expect(Insurance.all).to eq []
  end

  it 'saves the insurance to the insurance_companies table' do
    test_insurance = Insurance.new('Red Shield')
    test_insurance.save
    expect(Insurance.all).to eq [test_insurance]
  end

  it 'returns true if the two insurance companies have the same name' do
    test_insurance1 = Insurance.new('Red Shield')
    test_insurance2 = Insurance.new('Red Shield')
    expect(test_insurance1).to eq test_insurance2
  end
end
