class Hospital < ApplicationRecord
  has_many :doctors, dependent: :destroy


  validates_presence_of :name,
                        :street,
                        :city,
                        :state,
                        :zip
end
