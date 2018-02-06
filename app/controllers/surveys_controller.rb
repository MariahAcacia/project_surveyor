class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end


  def new
    @survey = Survey.new
  end


  def create
    @survey = Survey.new(whitelisted_params)
    if @survey.save
      flash[:success] = "Survey Created Successfully!"
      redirect_to root_path
    else
      flash[:danger] = "Survey Could NOT Be Created"
      render :new
    end
  end


  private


  def whitelisted_params
    params.require(:survey).permit(:title, :description)
  end


end
