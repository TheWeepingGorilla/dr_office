require 'rspec'
require 'pg'
require 'doctor'

describe Doctor do

  it 'is initialized with a name and specialty' do
    test_doctor = Doctor.new('Dr. Mac', 'Ruby')
    expect(test_doctor).to be_an_instance_of Doctor
  end

  it 'should return values for name and specialty' do
    test_doctor = Doctor.new('Dr. Mac', 'Ruby')
    expect(test_doctor.name).to eq 'Dr. Mac'
    expect(test_doctor.specialty).to eq 'Ruby'
  end
end
