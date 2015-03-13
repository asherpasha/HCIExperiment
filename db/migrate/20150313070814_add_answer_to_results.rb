class AddAnswerToResults < ActiveRecord::Migration
  def change
    add_column :results, :answer, :integer
    add_column :results, :subject_answer, :integer
  end
end
