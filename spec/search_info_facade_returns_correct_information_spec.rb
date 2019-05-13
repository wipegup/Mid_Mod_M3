require 'rails_helper'

feature "Search Info Facade" do
  before :each do
    @sif = SearchInfoFacade.new(80206)
  end
  scenario "returns only stations within 5 miles" do
    fuel_stations = (0..20).map{|dist| {
                                        distance: dist.to_f+0.9,
                                        access_days_times: '24H',
                                        fuel_type: 'ELEC',
                                        street_address: '123 Here',
                                        name: 'A Name'
                                       }
    }

    all_stations_hash = { total_results: 50, fuel_stations: fuel_stations}
    allow_any_instance_of(SearchService).to receive(:all_stations).and_return(all_stations_hash)

    expect(@sif.nearest_stations.count).to eq(5)

  end

  scenario "returns max of 15 stations" do
    fuel_stations = ([1]*20).map{|dist| {
                                        distance: dist.to_f+0.9,
                                        access_days_times: '24H',
                                        fuel_type: 'ELEC',
                                        street_address: '123 Here',
                                        name: 'A Name'
                                       }
    }

    all_stations_hash = { total_results: 50, fuel_stations: fuel_stations}
    allow_any_instance_of(SearchService).to receive(:all_stations).and_return(all_stations_hash)

    expect(@sif.nearest_stations.count).to eq(15)

  end

  scenario 'returns stations in increasing distance order' do
    fuel_stations = (0..20).map{|dist| {
                                        distance: (2-(dist.to_f/10)),
                                        access_days_times: '24H',
                                        fuel_type_code: 'ELEC',
                                        street_address: '123 Here',
                                        station_name: "Station #{dist}"
                                       }
    }

    all_stations_hash = { total_results: 50, fuel_stations: fuel_stations}
    allow_any_instance_of(SearchService).to receive(:all_stations).and_return(all_stations_hash)
    nearest = @sif.nearest_stations
    binding.pry

    expect(nearest.first.name).to eq("Station 20")
    expect(nearest.last.name).to eq("Station 5")

  end
end
