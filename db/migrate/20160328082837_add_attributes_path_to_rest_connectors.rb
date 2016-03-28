class AddAttributesPathToRestConnectors < ActiveRecord::Migration[5.0]
  def change
    add_column :rest_connectors, :attributes_path, :string
  end
end
