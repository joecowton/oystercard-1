require './lib/journey.rb'
require './lib/station.rb'

class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE= 1
  attr_reader :balance, :history, :journey

  def initialize(balance = DEFAULT_BALANCE, journey = Journey.new)
    @balance = balance
    @history = []
    @journey = journey
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise ('insufficent balance on the card') unless sufficent_money?
    deduct if journey.in_journey? #both entry and exit station present
    journey.reset_entry_station if journey.in_journey?
    journey.entry_station(station)
  end

  def touch_out(station)
    raise('card did not touch in') unless journey.in_journey?
    deduct
    journey.exit_station(station)
    @history << journey.current
    journey.complete
  end


private

  def deduct
    @balance -= journey.fare
  end

  def limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end

  def sufficent_money?
    balance > MINIMUM_CHARGE
  end

end
