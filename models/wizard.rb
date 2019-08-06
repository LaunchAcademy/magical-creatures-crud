class Wizard
  def initialize(name, age, image)
    @name = name
    @age = age
    @image = image
  end

  def self.all
      # - alternative constructor class method
      # - accepts no argument
      # - returns an array of wizard objects
      # - uses CSV.forEach or readlines

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


  # we could continue to run model level validations that say, dont allow an wizard with the same name twice
