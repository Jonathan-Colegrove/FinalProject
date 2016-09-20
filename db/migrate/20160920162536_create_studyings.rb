class CreateStudyings < ActiveRecord::Migration[5.0]
  def change
    create_table :studyings do |t|
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
