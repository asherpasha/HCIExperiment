class AddMoreQuestionnaireToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :gender, :string
    add_column :subjects, :color_test, :string
    add_column :subjects, :input_type, :string
  end
end
