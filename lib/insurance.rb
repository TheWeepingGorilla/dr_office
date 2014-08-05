class Insurance

  attr_accessor :name, :id

  def initialize(name, id=nil)
    @name = name
    @id = id
  end

  def self.all
    companies =[]
    results = DB.exec("SELECT * FROM insurance_companies;")
    results.each do |result|
      current_name = result["name"]
      current_company = Insurance.new(current_name)
      companies << current_company
    end
    companies
  end

  def save
    results = DB.exec("INSERT INTO insurance_companies (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_insurer)
    self.name == another_insurer.name
  end
end
