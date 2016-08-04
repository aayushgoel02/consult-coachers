class VchainController < ApplicationController
  def index
    dbsize = Vchainquestion.count
    @questionnum = rand(1..dbsize)
  end

  def practice
    @question = Vchainquestion.find(params[:question].to_i)
    @numquestions = @question.questiontext.split(";").size
    @initquestion = @question.questiontext.split(";")[params[:example].to_i]
    @examplenum = params[:example].to_i
  end

  def check
    @question = Vchainquestion.find(params[:answerform][:questionnum])
    @keyword = @question.keywordtext.split(";")[params[:answerform][:examplenum].to_i]
    @text = "A";
    if @keyword == params[:answerform][:answer]
      @text = "Correct answer!"
      respond_to do |format|
        format.js { render :action => "correct"}
      end
    else
      @text = "Wrong Answer!"
      respond_to do |format|
        format.js { render :action => "wrong"}
      end
    end

  end
end
