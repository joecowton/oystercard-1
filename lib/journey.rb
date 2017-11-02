class Journey

  MINIMUM_CHARGE= 1
  attr_reader :entry_station, :exit_station, :current_journey # :complete

  def initialize
      @entry_station = nil
      @exit_station = nil
  end

  def entry_station(station)
    @entry_station = station
  end

  def exit_station(station)
    @exit_station = station
  end

  def current
    {entry: @entry_station, exit: @exit_station }
  end

  def in_journey?
     !!@entry_station
  end

  def reset_entry_station
      @entry_station = nil
  end

  def complete
     @entry_station = nil
     @exit_station = nil
     puts "Journey complete!!!!!!!!!!"
  end

  def penalty_fare
    @entry_station && @exit_station ? 0 : 5
  end

  def fare
    MINIMUM_CHARGE + penalty_fare
  end

end
