class Station
  def initialize(name: name , zone: zone)
    @name = name
    @zone = zone
  end
  attr_reader :name , :zone
end
