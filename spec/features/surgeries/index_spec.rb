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

  end
end




# I also see a link to add a surgery
# When I click that link
# I’m taken to a new form to create a surgery
# When I fill in the form with a title, day of the week, and operating room number
# And hit submit
# I am taken back to the surgeries index page where I can see this new surgery’s title listed
# ​
