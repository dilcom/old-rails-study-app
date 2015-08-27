class RenameColumnTitleInTableFeedbacksToName < ActiveRecord::Migration
  def change
    rename_column :feedbacks, :title, :name
    rename_column :feedbacks, :body, :message
  end
end
