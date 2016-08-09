class VchainController < ApplicationController
  def index
    @questiontot = Question.where("module = 'Value Chain'")
    dbsize = @questiontot.maximum("questionnumber")
    @questionnum = rand(1..dbsize)
  end

  def practice
    @questiontot = Question.where("module = 'Value Chain'")
    @questions = @questiontot.where("questionnumber = "+params[:questionnum])
    @numquestions = @questions.count
    @question = @questions.where("ordernumber = "+params[:ordernum]).first
    @ordernum = params[:ordernum].to_i
    @initquestion = "A"
    begin
      @initquestion = @question.question
    rescue

    end
  end

  def check
    @questiontot = Question.where("module = 'Value Chain'")
    @question = @questiontot.where("questionnumber = "+params[:answerform][:questionnum]+" AND ordernumber = "+params[:answerform][:ordernum]).first
    @answer = @question.answer
    @text = "A";
    if @answer == params[:answerform][:answer]
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
