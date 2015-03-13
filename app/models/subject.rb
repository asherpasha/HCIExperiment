class Subject < ActiveRecord::Base
  has_many :results

  before_create :set_group
  after_create :create_results

  attr_accessible :name, :age, :username, :experiment_group, :email

  def create_results
    (1..5).each do |stimuli_number|
      self.results.create(subject_id: self.id, stimuli_number: stimuli_number)
    end
  end

  def set_group
    if Subject.count == 0
      self.experiment_group = 1
    else
      self.experiment_group = Subject.group(:experiment_group).count.sort_by{|v| v.last}.first()[0]
    end
  end
end
