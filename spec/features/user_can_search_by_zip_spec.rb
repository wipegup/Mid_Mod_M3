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
    end
  end
end
