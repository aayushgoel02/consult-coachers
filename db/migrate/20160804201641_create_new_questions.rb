class CreateNewQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
       t.text :module
       t.integer :questionnumber
       t.integer :ordernumber
       t.integer :questiontype
       t.text :question
       t.text :options
       t.text :answer
       t.text :suggestions
       t.timestamps
    end
  end
end
