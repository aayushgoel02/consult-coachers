class WelcomeController < ApplicationController
  def index

  end

  def practice
    @question = Question.find(1)
    @numquestions = @question.questiontext.split(";").size
    @initquestion = @question.questiontext.split(";")[0]
  end

  def check
    @question = Question.find(params[:answerform][:questionnum])
    @keyword = @question.keywordtext.split(";")[0]
    if @keyword == params[:answerform][:answer]
      render 'index'
    else
      redirect_to practice_path
    end

  end
end
