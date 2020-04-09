class AddTagToKeywords < ActiveRecord::Migration[5.2]
  def change
    add_column :keywords, :tag, :string
  end
end
