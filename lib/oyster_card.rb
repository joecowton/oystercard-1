require './lib/journey.rb'
require './lib/station.rb'

class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE= 1
  attr_reader :balance, :entry_station, :history, :journey

  def initialize(balance = DEFAULT_BALANCE, journey = Journey)
    @balance = balance
    @entry_station = nil
    @history = []
    @journey = journey
  end

  def top_up(amount)
    top_up_error?(amount)
    @balance += amount
  end

  def touch_in(station)
    touch_in_error?
    @entry_station = station
  end

  def touch_out(station)
    touch_out_error?
    deduct(MINIMUM_CHARGE)
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

  def in_journey?
    @entry_station
  end

  def deduct(amount)
    @balance -= amount
  end

  def top_up_error?(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if limit?(amount)
  end

  def touch_in_error?
    raise ('insufficent balance on the card') unless sufficent_money?
    raise('card already in use') if in_journey?
  end

  def touch_out_error?
    raise('card did not touch in') unless in_journey?
  end


end
