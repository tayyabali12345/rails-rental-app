# frozen_string_literal: true

class Lease < ApplicationRecord
  belongs_to :user
  belongs_to :property
end
