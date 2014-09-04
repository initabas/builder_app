class CreateHires < ActiveRecord::Migration
  def change
    create_table :hires do |t|
      t.integer :job_id
      t.integer :worker_id
      t.integer :user_id

      t.timestamps
    end
  end
end
