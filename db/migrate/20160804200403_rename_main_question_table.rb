class RenameMainQuestionTable < ActiveRecord::Migration
  def change
    rename_table :vchainquestions,:questions
  end
end
