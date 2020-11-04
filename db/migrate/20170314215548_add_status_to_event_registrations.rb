class AddStatusToEventRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :event_registrations, :status, :integer, default: 0
  end
end
