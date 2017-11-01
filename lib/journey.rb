class Journey

  MINIMUM_CHARGE= 1
  attr_accessor :entry_station, :exit_station

  def initialize
    # @entry_station = entry_station
    # @exit_station = exit_station
  end

  def entry_station(station)
    @entry_station = station
  end
  def in_journey?
    @entry_station
  end

  def fare(amount)
    @balance -= amount
  end



end
