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
    @options = "A";
    begin
      @options = @question.options.split(";")
    rescue
    end
    begin
      @initquestion = @question.question
    rescue
    end
  end

  def check
    @questiontot = Question.where("module = 'Value Chain'")
    begin
      @question = @questiontot.where("questionnumber = "+params[:questionnum]+" AND ordernumber = "+params[:ordernum]).first
      @options = @question.options.split(";")
      @suggestions = @question.suggestions.split(";")
      @answer = @question.answer
      @text = "A";
      @correct = 0;
      if @answer == @options[params[:choice].to_i]
        @text = @suggestions[params[:choice].to_i]
        @correct = 1;
        respond_to do |format|
          format.js { render :action => "correct"}
        end
      else
        @text = @suggestions[params[:choice].to_i]
        @correct = 0;
        respond_to do |format|
          format.js { render :action => "correct"}
        end
      end
    rescue
      @question = @questiontot.where("questionnumber = "+params[:answerform][:questionnum]+" AND ordernumber = "+params[:answerform][:ordernum]).first
      @suggestions = @question.suggestions.split(";")
      @answer = @question.answer
      @text = "A";
      @correct = 0;
      if @answer == params[:answerform][:answer]
        @text = @suggestions[0]
        @correct = 1
        respond_to do |format|
          format.js { render :action => "correct"}
        end
      else
        @text = @suggestions[1]
        @correct = 0
        respond_to do |format|
          format.js { render :action => "correct"}
        end
      end
    end

  end
end
