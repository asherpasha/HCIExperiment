class SubjectsController < ApplicationController
  def new
  end

  def update
    @subject = Subject.find_by_id(params[:id])
    @subject.update_attributes(params[:subject] || {})
    @subject.save
  end
 
  def create
    @subject = Subject.new(params[:subject])
    @subject.save
    respond_to do |format|
      format.json {render :json => @subject.to_json}
    end
  end
end
