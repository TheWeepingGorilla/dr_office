require 'rspec'
require 'pg'
require 'specialty'

DB = PG.connect({:dbname => 'doctors_office_tools'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM specialties *;")
  end
end

describe Specialty do
  it 'creates an instance of the Specialty class' do
    dermatology = Specialty.new("dermatology")
    expect(dermatology).to be_an_instance_of Specialty
  end

  it 'return name of the specialty' do
    dermatology = Specialty.new("dermatology")
    expect(dermatology.specialty).to eq "dermatology"
  end

  it 'should start with no ids in database' do
    dermatology = Specialty.new("dermatology")
    expect(Specialty.all).to eq []
  end

  it 'should return all specialties in the database' do
    dermatology = Specialty.new("dermatology")
    dermatology.save
    expect(Specialty.all).to eq [dermatology]
  end
end

