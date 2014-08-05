class Doctor

  attr_accessor :name, :specialty

  def initialize(name, specialty)
    @name = name
    @specialty = specialty
  end

  def save
    DB.exec("INSERT INTO doctors (name,specialty) VALUES ('#{@name}','#{@specialty}');")
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |doctor|
      current_name = doctor["name"]
      current_specialty = doctor["specialty"]
      current_doctor = Doctor.new(current_name, current_specialty)
      doctors << current_doctor
    end
    doctors
  end

  def ==(another_doctor)
    (@name == another_doctor.name) && (@specialty == another_doctor.specialty)
  end

end


