# frozen_string_literal: true

class User < ApplicationRecord
  has_one :lease, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_one_attached :image

  enum user_type: { property_manager: 0, receptionist: 1, renter: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
