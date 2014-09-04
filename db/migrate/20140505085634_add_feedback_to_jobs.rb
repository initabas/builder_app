class AddFeedbackToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :feedback, :text
  end
end
