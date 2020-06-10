class Surgery < ApplicationRecord
  has_many :doctor_surgeries

  has_many :doctors, through: :doctor_surgeries


  validates_presence_of :title,
                        :day_of_week,
                        :operating_room_number

  def count_of_doctors
    doctors.count
  end



end
