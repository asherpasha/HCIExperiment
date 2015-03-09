class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :subject_id
      t.integer :stimuli_number
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
