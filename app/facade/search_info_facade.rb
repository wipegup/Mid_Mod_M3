class SearchInfoFacade
  def initialize(zip_code)
    @zip_code = zip_code
    # binding.pry
  end

  def total_stations
    all_stations[:total_results]
  end

  def nearest_stations
    # binding.pry
    nearest=all_stations[:fuel_stations].take(15).map do |station_info|
      Station.new(station_info)
    end

    nearest.select{ |station| station.distance <5}
  end

  private

  def search_service
    @service ||= SearchService.new(@zip_code)
  end

  def all_stations
    @stations ||= search_service.all_stations
  end
end
