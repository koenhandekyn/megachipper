class AddExtraToTimeRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :time_registrations, :extra, :decimal, default: 0.0
  end
end
