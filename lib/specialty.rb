class Specialty
  attr_accessor :specialty, :id

  def initialize(specialty, id=nil)
    @specialty = specialty
    @id = id
  end

  def self.all
    specialties = []
    results = DB.exec("SELECT * FROM specialties;")
    results.each do |special|
      current_id = special["id"]
      current_description = special["specialty"]
      current_specialty = Specialty.new(current_description, current_id)
      specialties << current_specialty
    end
    specialties
  end

  def save
    results = DB.exec("INSERT INTO specialties (specialty) VALUES ('#{@specialty}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_specialty)
    self.specialty == another_specialty.specialty
  end

  def get_doctors
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{@id};")
    results.each do |result|
      doctor_name = result["name"]
      doctor_id = result["id"].to_i
      doctor_specialty_id = result["specialty_id"].to_i
      doctor_insurance_id = result["insurance_id"].to_i
      current_doctor = Doctor.new(doctor_name, doctor_specialty_id, doctor_insurance_id, doctor_id)
      doctors << current_doctor
    end
    doctors
  end

end
