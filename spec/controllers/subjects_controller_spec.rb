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

  describe "update" do
    it "should update the subject with the right attributes" do
      @attributes = {name: 'changed name', age: 26}
      @subject = Subject.new(name: 'simon cook', age: 26)
      @subject.save
      @subject.reload
      xhr :put, :update, :format => 'json', id: @subject.id, subject: @attributes
      @subject.reload
      expect(@subject.name).to eq('changed name')
    end
  end
end
