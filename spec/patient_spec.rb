require 'rspec'
require 'pg'
require 'doctor'
require 'patient'

test_patient = Patient.new('Bill Murray', '1999-01-08')
DB = PG.connect({:dbname => 'doctors_office_tools'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
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

  it 'starts with no patients' do
    expect(Patient.all).to eq []
  end

  it 'saves a patient to the database' do
    test_patient.save
    expect(Patient.all).to eq [test_patient]
  end

  it 'returns true if two patients have the same name and birthday' do
    test_patient2 = Patient.new('Bill Murray', '1999-01-08')
    expect(test_patient).to eq test_patient2
  end
end
