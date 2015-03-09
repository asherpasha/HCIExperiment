class Subject < ActiveRecord::Base
  has_many :results
  after_create :create_results

  attr_accessible :name, :age, :username, :group

  def create_results
    (1..5).each do |stimuli_number|
      self.results.create(subject_id: self.id, stimuli_number: stimuli_number)
    end
  end
end
