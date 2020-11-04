class AddDairyAndCrashSpaceToEventRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :event_registrations, :dairy_free, :boolean, default: false
    add_column :event_registrations, :have_crash_space, :boolean, default: false
  end
end
