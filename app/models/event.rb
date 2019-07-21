class Event < ApplicationRecord
  belongs_to :place

  validates :name, presence: true
  validates :date, presence: true
end
