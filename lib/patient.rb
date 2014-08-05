class Patient
  attr_accessor :name,:birthday

  def initialize(name,birthday)
    @name = name
    @birthday = birthday
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
    DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@birthday}');")
  end

  def ==(another_patient)
    (@name == another_patient.name) && (@birthday == another_patient.birthday)
  end

end
