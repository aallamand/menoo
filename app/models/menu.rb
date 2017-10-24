class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :foods, dependent: :nullify
end
