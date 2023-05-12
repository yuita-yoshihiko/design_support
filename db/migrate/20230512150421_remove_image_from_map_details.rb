class RemoveImageFromMapDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :map_details, :image, :string
  end
end
