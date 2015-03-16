class Subject < ActiveRecord::Base
  has_many :results

  before_create :set_group

  attr_accessible :name, :age, :username, :experiment_group, :email, :efp_experience, :rsvp_experience, :experience_difficulty, :display_helpfulness, :interaction_rating, :gender, :color_test, :input_type

  def create_results
    (1..5).each do |stimuli_number|
      self.results.create(subject_id: self.id, stimuli_number: stimuli_number)
    end
  end

  def set_group
    if Subject.where(experiment_group: 1).count == 0
      self.experiment_group = 1
    elsif Subject.where(experiment_group: 2).count == 0
      self.experiment_group = 2
    elsif Subject.where(experiment_group: 3).count == 0
      self.experiment_group = 3
    elsif Subject.where(experiment_group: 4).count == 0
      self.experiment_group = 4
    else
      self.experiment_group = Subject.group(:experiment_group).count.sort_by{|v| v.last}.first()[0]
    end
  end
end
