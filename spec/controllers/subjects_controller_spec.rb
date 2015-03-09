require 'spec_helper'

describe SubjectsController do
  describe "create" do
    it "should create a subject with the right attributes" do
      @attributes = {name: 'simon cook', age: 26}
      expect do
        xhr :post, :create, :format => 'json', subject: @attributes
      end.to change(Subject, :count).by(1)
    end
  end
end
