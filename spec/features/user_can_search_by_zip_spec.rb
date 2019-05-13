require 'rails_helper'

feature "User can visit root page" do
  scenario "and view nearest stations by zip" do
    visit "/"

    fill_in "AltFuelFinder", with: 80206
    click_button "Search"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("93 Stations")
    expect(page).to have_css(".station", count: 15)
  end
end
