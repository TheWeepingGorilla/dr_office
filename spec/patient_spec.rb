require 'rspec'
require 'pg'
require 'doctor'
require 'patient'

test_patient = Patient.new('Bill Murray', '1999-01-08')
DB = PG.connect({:dbname => 'doctors_office_tools'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end
end

describe Patient do

  it 'initializes with a name and birthday' do
    expect(test_patient).to be_an_instance_of Patient
  end

  it 'returns the name and birthday of the patient' do
    expect(test_patient.name).to eq 'Bill Murray'
    expect(test_patient.birthday).to eq '1999-01-08'
  end
end
