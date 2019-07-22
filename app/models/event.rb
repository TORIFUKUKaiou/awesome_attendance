class Event < ApplicationRecord
  belongs_to :place
  has_many :attendances, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :date, uniqueness: { scope: :place_id }
end
