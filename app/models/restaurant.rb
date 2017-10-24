class Restaurant < ApplicationRecord
  has_many :menus, dependent: :nullify
end
