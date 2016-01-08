class EventRegistration < ActiveRecord::Base
  FOOD_OPTIONS = ["Carnivore", "Vegetarian"]
  SHIRT_SIZES = ["S", "M", "L", "XL"]

  belongs_to :special_event

  after_initialize :set_defaults, if: :new_record?

  private

  def set_defaults
    self.extra_hab         ||= nil
    self.extra_hab_size    ||= nil
    self.registration_date ||= Date.current
    self.paid              ||= false
  end
end
