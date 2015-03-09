require 'spec_helper'

describe Subject do
  describe "create_tests" do
    it "should create 5 tests" do
      @subject = Subject.new(name: 'something', group: 1)
      @subject.save
      @subject.reload
      expect(@subject.results.count).to eq(5) 
    end
  end
end
