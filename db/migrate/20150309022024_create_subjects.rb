class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :age
      t.string :integer
      t.string :username

      t.timestamps null: false
    end
  end
end
