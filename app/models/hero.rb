class Hero < ApplicationRecord
  has_many :itemizations, dependent: :destroy
  has_many :items, through: :itemizations
end
