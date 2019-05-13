class SearchInfoFacade
  def initialize(zip_code)
    @zip_code = zip_code
    binding.pry
  end


  private

  def search_service
    @service ||= SearchService.new(@zip_code)
  end

  def all_stations
    @stations ||= search_service.all_stations
  end
end
