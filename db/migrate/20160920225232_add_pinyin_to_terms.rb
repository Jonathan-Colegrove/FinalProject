class AddPinyinToTerms < ActiveRecord::Migration[5.0]
  def change
    add_column :terms, :pinyin, :string
  end
end
