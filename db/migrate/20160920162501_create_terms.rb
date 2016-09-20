class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :english
      t.string :chinese_traditional
      t.string :chinese_simplified

      t.timestamps
    end
  end
end
