class SpecialEvent < ActiveRecord::Base
  validates :name, :date, :url_code, presence: true

  has_many :event_registrations
end
