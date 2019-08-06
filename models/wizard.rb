class Wizard

  attr_reader :id, :name, :age, :power_type

  def initialize(id, name, age, power_type)
    @id = id
    @name = name
    @age = age
    @power_type = power_type
  end

  # double check wizards path
  def self.all
    @wizards = []
    CSV.foreach("wizards.csv", headers: true) do |row|
      @wizards << Wizard.new(
        row["id"],
        row["name"],
        row["age"],
        row["power_type"]
      )
    end
    return @wizards
  end

  def self.create(name, age, power_type)
      # takes in three arguments
      # persists the new wizard
      # returns a newly created wizard object
    # - uses CSV.open
  end

  def self.find(name)
      # - alternative constructor class method
      # - accepts an name as an argument
      # - returns a single wizard object whose name matches the given name
      # - uses CSV.forEach or readlines
  end
end

  # we could continue to run model level validations that say, dont allow an wizard with the same name twice
