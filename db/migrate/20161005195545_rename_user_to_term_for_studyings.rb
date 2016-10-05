class RenameUserToTermForStudyings < ActiveRecord::Migration[5.0]
  def change
    rename_column :studyings, :user_id, :term_id
  end
end
