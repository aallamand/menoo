class Restaurant < ApplicationRecord
  has_many :menus, dependent: :nullify
  include AlgoliaSearch

  algoliasearch per_environment: true, disable_indexing: Rails.env.test? do
    attribute :name, :address
  end
end

