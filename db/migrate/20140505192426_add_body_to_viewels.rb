class AddBodyToViewels < ActiveRecord::Migration
  def change
    add_column :viewels, :body, :string
  end
end
