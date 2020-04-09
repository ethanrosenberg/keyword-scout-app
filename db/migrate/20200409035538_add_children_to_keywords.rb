class AddChildrenToKeywords < ActiveRecord::Migration[5.2]
  def change
    add_column :keywords, :children, :string, array: true, :default => []
  end
end
