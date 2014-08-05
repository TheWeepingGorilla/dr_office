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
end
