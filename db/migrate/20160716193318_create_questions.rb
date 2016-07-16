class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
       t.text :questiontext
       t.text :keywordtext
       t.timestamps
    end
  end
end
