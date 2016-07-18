class RenameQuestionTable < ActiveRecord::Migration
  def change
    rename_table :questions,:vchainquestions
  end
end
