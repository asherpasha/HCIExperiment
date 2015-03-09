class Result < ActiveRecord::Base
  belongs_to :user
  attr_accessible :stimuli_number, :start_time, :end_time
end
