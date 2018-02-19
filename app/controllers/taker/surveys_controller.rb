class Taker::SurveysController < ApplicationController


  def show
    @survey = Survey.find(params[:id])
  end


  def edit
    @survey = Survey.find(params[:id])
  end

end
