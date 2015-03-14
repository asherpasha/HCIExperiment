class AddQuestionnaireColumnsToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :interaction_rating, :integer
    add_column :subjects, :display_helpfulness, :integer
    add_column :subjects, :efp_experience, :integer
    add_column :subjects, :rsvp_experience, :text
    add_column :subjects, :experience_difficulty, :text
  end
end
