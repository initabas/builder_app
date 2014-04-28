class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.text :about

      t.timestamps
    end
  end
end
