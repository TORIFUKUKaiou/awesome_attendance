class Org < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
