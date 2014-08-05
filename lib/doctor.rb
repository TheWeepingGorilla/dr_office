class Doctor

  attr_accessor :name, :specialty_id, :insurance_id, :id

  def initialize(name, specialty_id, insurance_id, id=nil)
    @name = name
    @specialty_id = specialty_id
    @id = id
    @insurance_id = insurance_id
  end

  def save
    results = DB.exec("INSERT INTO doctors (name, specialty_id, insurance_id) VALUES ('#{@name}','#{@specialty_id}', '#{@insurance_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |doctor|
      current_name = doctor["name"]
      current_specialty_id = doctor["specialty_id"].to_i
      current_insurance_id = doctor["insurance_id"].to_i
      current_doctor = Doctor.new(current_name, current_specialty_id, current_insurance_id)
      doctors << current_doctor
    end
    doctors
  end

  def ==(another_doctor)
    (@name == another_doctor.name) && (@specialty_id == another_doctor.specialty_id) && (@insurance_id == another_doctor.insurance_id)
  end

end


