class AddPendingNotificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending_notification, :integer
  end
end
