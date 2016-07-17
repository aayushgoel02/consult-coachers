class WelcomeController < ApplicationController
  def index

  end

  def practice
    @question = Question.find(1)
    @initquestion = @question.questiontext.split(";")[0];
  end
end
