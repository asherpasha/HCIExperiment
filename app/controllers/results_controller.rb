class ResultsController < ApplicationController
  def update
    @result = Result.find_by_id(params[:id])
    @result.update_attributes(params[:result])
    @result.save
    respond_to do |format|
      format.json {render :json => @result.to_json}
    end
  end

  def create
    puts params
    @result = Result.new(params[:result])
    @result.save
    respond_to do |format|
      format.json {render :json => @result.to_json}
    end
  end
end
