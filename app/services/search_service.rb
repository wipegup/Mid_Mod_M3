class SearchService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stations
    response = conn.get 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json',
     {'status' => 'E',
     'access' => 'public',
     'fuel_type' => 'ELEC,LPG',}
     JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new do |f|
      f.adapter Faraday.default_adapter
      f.params['location'] = @zip_code
      f.params['api_key'] = ENV['key']
    end
  end
end
