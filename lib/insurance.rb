class Insurance

  attr_accessor :name, :id

  def initialize(name, id=nil)
    @name = name
    @id = id
  end
end
