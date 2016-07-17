class WelcomeController < ApplicationController
  def index

  end

  def practice
    @question = Question.find(1)
    @numquestions = @question.questiontext.split(";").size
    @initquestion = @question.questiontext.split(";")[params[:question].to_f]
  end

  def check
    @question = Question.find(params[:answerform][:questionnum])
    @keyword = @question.keywordtext.split(";")[0]
    if @keyword == params[:answerform][:answer]
      redirect_to practice_path(:question => 1)
    else
      redirect_to practice_path(:question => 0)
    end

  end
end
