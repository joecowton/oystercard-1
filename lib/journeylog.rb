class JourneyLog

attr_reader :journeys

def initialize
  @journeys = []
  @current_journey = nil
end

def start(station)
  @current_journey = Journey.new(station)
end

def finish(station)
  @current_journey.exit_station(station)
  current_journey
end

def aquire_fare
  @current_journey.fare
end

private

def current_journey
  @journeys << @current_journey
end

end
