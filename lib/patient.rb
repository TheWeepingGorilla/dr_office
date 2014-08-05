class Patient
  attr_accessor :name,:birthday,:id

  def initialize(name,birthday,id=nil)
    @name = name
    @birthday = birthday
    @id = id
  end

  def self.all
    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each do |patient|
      current_name = patient["name"]
      current_birthday = patient["birthday"]
      formatted_birthday = current_birthday.split(" ")[0]
      current_patient = Patient.new(current_name, formatted_birthday)
      patients << current_patient
    end
    patients
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@birthday}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_patient)
    (@name == another_patient.name) && (@birthday == another_patient.birthday)
  end

  def assign(doctor_id)
    DB.exec("INSERT INTO patients_doctors (doctor_id, patient_id) VALUES (#{doctor_id},#{@id});")
  end

  def which_doctors?
    doctors = []
    results = DB.exec("SELECT * FROM patients_doctors WHERE patient_id = #{@id};")
    results.each do |patient_doctor|
      doctors << patient_doctor["doctor_id"].to_i
    end
    doctors
  end
end
