class Result < ActiveRecord::Base
  belongs_to :user
  attr_accessible :subject_id, :stimuli_number, :start_time, :end_time
end
