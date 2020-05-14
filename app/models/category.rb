class Category < ApplicationRecord
  has_many :items
  has_ancesty
end
