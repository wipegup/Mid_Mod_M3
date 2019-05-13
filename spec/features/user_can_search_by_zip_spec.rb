require 'rails_helper'

feature "User can visit root page" do
  scenario "and view nearest stations by zip" do
    visit "/"
    # save_and_open_page

    fill_in "q", with: 80206

    click_button "Locate"
    save_and_open_page
    expect(current_path).to eq(search_path)
    expect(page).to have_content("93 Stations")
    within('#nearest-stations') do
      expect(page).to have_css(".station", count: 15)
      stations = all(".station")
      stations.each do |station|
        expect(page).to have_css('.name')
        expect(page).to have_css('.address')
        expect(page).to have_css('.fuel_type')
        expect(page).to have_css('.distance')
        expect(page).to have_css('.access_times')

      end
    end
  end
end
