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
    within_radius = all_stations[:fuel_stations].select{|station| station[:distance]<5}
    sorted_by_distance = within_radius.sort_by{|s| s[:distance]}

    sorted_by_distance.take(15).map do |station_info|
      Station.new(station_info)
    end

  end

  private

  def search_service
    @service ||= SearchService.new(@zip_code)
  end

  def all_stations
    @stations ||= search_service.all_stations
  end
end
