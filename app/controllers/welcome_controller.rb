class WelcomeController < ApplicationController
  def index
    dbsize = Question.count
    flash[:notice] = ""
    @questionnum = rand(1..dbsize)
  end

  def practice
    @question = Question.find(params[:question].to_i)
    @numquestions = @question.questiontext.split(";").size
    @initquestion = @question.questiontext.split(";")[params[:example].to_i]
    @examplenum = params[:example].to_i
  end

  def check
    @question = Question.find(params[:answerform][:questionnum])
    @keyword = @question.keywordtext.split(";")[params[:answerform][:examplenum].to_i]
    if @keyword == params[:answerform][:answer]
      flash[:notice] = "Correct Answer!"
      redirect_to practice_path(:question => params[:answerform][:questionnum],:example => params[:answerform][:examplenum].to_i+1)
    else
      flash[:notice] = "Wrong Answer!"
      redirect_to practice_path(:question => params[:answerform][:questionnum],:example => params[:answerform][:examplenum].to_i)
    end

  end
end
