class Vehicle
  attr_reader(:make, :model, :year, :color, :engine_size, :number_of_doors, :id)
  @@vehicles = []

  define_method(:initialize) do |attributes|
    @make = attributes[:make]
    @model = attributes[:model]
    @year = attributes[:year].to_i
    @color = attributes[:color]
    @engine_size= attributes[:engine_size]
    @number_of_doors = attributes[:number_of_doors]
    @id = @@vehicles.length().+(1)
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:age) do
    current_year = Time.new().year()
    current_year.-(@year)
  end

  define_method(:worth_buying?) do
    american_cars = ["Chrysler", "Ford", "GM"]
    american_cars.include?(@make).&(self.age().<=(15))
  end


  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      end
    end
    found_vehicle
  end
end
