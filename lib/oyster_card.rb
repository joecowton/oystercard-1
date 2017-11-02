require './lib/journey.rb'
require './lib/station.rb'
require './lib/journeylog.rb'

class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE= 1
  attr_reader :balance, :journey

  def initialize(balance = DEFAULT_BALANCE, journey = JourneyLog.new)
    @balance = balance
    @journey_log = journey
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise ('insufficent balance on the card') unless sufficent_money?
    # deduct if journey.in_journey? #both entry and exit station present
    @journey_log.start(station)

    # journey.reset_entry_station if journey.in_journey?
    # journey.entry_station(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct_fare(@journey_log.aquire_fare)

  #   raise('card did not touch in') unless journey.in_journey?
  #   journey.complete
  end


private

  def deduct_fare(amount)
    @balance -= amount.to_i
  end

  def limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end

  def sufficent_money?
    balance > MINIMUM_CHARGE
  end

end
