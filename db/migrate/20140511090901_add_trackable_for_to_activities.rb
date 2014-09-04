class AddTrackableForToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :trackable_for, :string
  end
end
