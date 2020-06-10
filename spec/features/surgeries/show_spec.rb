require 'rails_helper'

RSpec.describe "Surgerys Show Page" do
  describe "When I a surgerys show page" do
    it "When I visit surgeries index page, I can click on a surgerys title and I'm taken to that surgerys show page" do
      heart = Surgery.create(title: "Heart Surgery", day_of_week: "Wednesday", operating_room_number: 410)
      apendix = Surgery.create(title: "Apendix Surgery", day_of_week: "Wednesday", operating_room_number: 316)

      grey_sloan = Hospital.create(name: "Grey Sloan Memorial Hospital",
                              street: "123 Save Lives Road",
                              city: "Seattle",
                              state: "WA",
                              zip:"98101"
                            )

     meridith = grey_sloan.doctors.create(name: "Meredith Grey",
                          specialty: "General Surgery",
                          education: "Harvard University"
                        )
     alex = grey_sloan.doctors.create(name: "Alex Karev",
                          specialty: "Pediatric Surgery",
                          education: "Johns Hopkins University"
                        )

    DoctorSurgery.create!(surgery: heart, doctor: alex)
    DoctorSurgery.create!(surgery: heart, doctor: meridith)

    visit "/surgeries"

    click_on "#{heart.title}"

    expect(current_path).to eq("/surgeries/#{heart.id}")
    expect(page).to have_content("Heart Surgery")
    expect(page).to have_content(410)
    expect(page).to have_content(2)

    end
  end
end
