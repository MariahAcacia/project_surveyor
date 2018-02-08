class QuestionsController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(survey_id: @survey.id)
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(whitelisted_params)
    if @question.save
      flash[:success] = "Okay! Lets get started!"
      redirect_to
    else
      flash[:danger] = "There is a problem with your submission"
      render :new
    end
  end


  private


  def whitelisted_params
    params.require(:question).permit(:number_of_options,
                                     :required,
                                     :multiple_select,
                                     :survey_id,
                                     :question,
                                     :options_attributes => [:id, :_destroy, :description, :question_id])
  end

end
