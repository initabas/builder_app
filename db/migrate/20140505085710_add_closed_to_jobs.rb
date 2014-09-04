class AddClosedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :closed, :boolean
  end
end
