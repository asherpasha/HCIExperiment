class SubjectsController < ApplicationController
  def new
  end

  def index
    
  end

  def show
    @subject = Subject.find_by_id(params[:id])
  end

  def update
    puts params[:subject]
    @subject = Subject.find_by_id(params[:id])
    @subject.update_attributes(params[:subject])
    @subject.save
    respond_to do |format|
      format.json {render :json => @subject.to_json}
    end
  end
 
  def create
    puts params
    puts params[:subject]
    @subject = Subject.new(params[:subject])
    @subject.save
    puts @subject.efp_experience
    respond_to do |format|
      format.json {render :json => @subject.to_json}
    end
  end
end
