class AddInfoToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
    add_column :pictures, :description, :string
  end
end
