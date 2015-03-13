require 'spec_helper'

describe ResultsController do

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should create a result for the given user ID" do
      @attributes = {subject_id: @subject.id, age: 26}
      expect do
        xhr :post, :create, :format => 'json', subject: @attributes
      end.to change(Subject, :count).by(1)

    end
  end

end
