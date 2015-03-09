class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :subject_id
      t.integer :group
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
