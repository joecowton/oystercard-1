require './lib/journey.rb'
require './lib/station.rb'

class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE= 1
  attr_reader :balance, :entry_station, :history, :journey

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
    raise('card already in use') if in_journey?
    journey.entry_station(station)
  end

  def touch_out(station)
    raise('card did not touch in') unless in_journey?
    fare(MINIMUM_CHARGE)
    @history << @journey.new(@entry_station, station)
    @entry_station = nil
  end

private

  def limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end

  def sufficent_money?
    balance > MINIMUM_CHARGE
  end

end
