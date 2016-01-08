class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.belongs_to :special_event
      t.string     :contact_email
      t.string     :hash_name
      t.string     :nerd_name
      t.string     :kennel
      t.string     :payment_email
      t.string     :food_preference
      t.boolean    :gluten_allergy
      t.boolean    :need_crash_space
      t.string     :extra_hab
      t.string     :extra_hab_size
      t.date       :registration_date
      t.boolean    :paid

      t.timestamps
    end
  end
end
