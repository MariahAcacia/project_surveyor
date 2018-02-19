class Creator::SurveysController < ApplicationController

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
      redirect_to create_survey_path(@survey)
    else
      flash[:danger] = "Survey Could NOT Be Created"
      render :new
    end
  end


  def show
    @survey = Survey.find(params[:id])
  end


  private


  def whitelisted_params
    params.require(:survey).permit(:title, :description,
                                  {:questions_attributes => [:id, :survey_id, :question, :required, :number_of_options, :_destroy,
                                  {:options_attributes => [:id, :question_id, :description, :_destroy]} ]})
  end


end
