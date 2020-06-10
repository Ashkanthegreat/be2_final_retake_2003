require 'rails_helper'

RSpec.describe "Surgeries Index Page" do
  it "Visitor can see title of all surgeries, link to add a surgery that takes you to a form where I can create a surgery" do
    heart = Surgery.create(title: "Heart Surgery", day_of_week: "Wednesday", operating_room_number: 210)
    apendix = Surgery.create(title: "Apendix Surgery", day_of_week: "Wednesday", operating_room_number: 316)
    knee = Surgery.create(title: "Knee Surgery", day_of_week: "Thursday", operating_room_number: 410)

    visit "/surgeries"

    expect(page).to have_content("Heart Surgery")
    expect(page).to have_content("Apendix Surgery")
    expect(page).to have_content("Knee Surgery")

    expect(page).to have_link("Add Surgery")

    click_on "Add Surgery"

    expect(current_path).to eq("/surgeries/new")

    fill_in "Title", with: "Back Surgery"
    fill_in "Day of Week", with: "Monday"
    fill_in "Operating Room Number", with: 210

    click_on "Create Surgery"

    expect(current_path).to eq("/surgeries")


  end
end
