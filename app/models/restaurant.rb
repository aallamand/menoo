class Restaurant < ApplicationRecord
  has_many :menus, dependent: :nullify
  include AlgoliaSearch

  algoliasearch do
    attribute :name, :address
  end
end

