class AddColumnsToWidgets < ActiveRecord::Migration[5.0]
  def change
  	add_column :widgets, :slug, :string
  	add_column :widgets, :verified, :boolean, default: false
  	remove_column :widgets, :layers # Layer moved to layers table
  end
end
