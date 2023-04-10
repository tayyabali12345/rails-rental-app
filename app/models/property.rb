# frozen_string_literal: true

class Property < ApplicationRecord
  enum property_type: { bedroom: 0, bedrooms: 1, duplex_type_appartments: 2 }

  belongs_to :user
  has_one :lease, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many_attached :images
end
