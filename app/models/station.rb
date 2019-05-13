class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(info)
    # binding.pry
    @access_times = info[:access_days_times]
    @distance = info[:distance]
    @fuel_type = info[:fuel_type_code]
    @address = info[:street_address]
    @name = [:station_name]
  end

end
