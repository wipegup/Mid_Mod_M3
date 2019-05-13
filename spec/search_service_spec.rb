require 'rails_helper'

feature "Search Service" do
  before :each do
    @search_service = SearchService.new(80206)
  end
  scenario 'only returns public, of status E, and ELEC and LPG' do
    all_stations = @search_service.all_stations


    expect(all_stations[:fuel_stations].all?{ |s| s[:status_code] == 'E'})
    expect(all_stations[:fuel_stations].all?{ |s| s[:fuel_type_code] == 'ELEC' || s[:fuel_type_code] == 'LPG'})
    expect(all_stations[:fuel_stations].all?{ |s| s[:access_code] == 'public'})
  end
end
