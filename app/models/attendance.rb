class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  attr_accessor :code, :place_id

  validates :user, uniqueness: { scope: :event_id }
end
