class Creator::QuestionsController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(survey_id: @survey.id)
  end


  def build_question
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(whitelisted_params)
    @options = []
    @question.number_of_options.times do |x|
      @options << @question.options.build
    end
    render :edit
  end


  def create
    @survey = Survey.find(params[:survey_id])
    if @question = @survey.questions.create!(whitelisted_params)
      flash[:success] = "Options saved successfully!"
      redirect_to creator_survey_path(@survey)
    else
      flash[:danger] = "There is a problem with your submission"
      render :edit
    end
  end


  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Question Successfully Deleted!"
      redirect_to creator_survey_path(Survey.find(params[:survey_id]))
    else
      flash[:danger] = "Question Could NOT be Deleted"
      redirect_to creator_survey_path(Survey.find(params[:survey_id]))
    end
  end


  private


  def whitelisted_params
    params.require(:question).permit(:number_of_options,
                                     :required,
                                     :multiple_select,
                                     :survey_id,
                                     :question,
                                     options_attributes: [:description, :_destroy])
  end



end
