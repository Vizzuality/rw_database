class AddConnectorTypeToDatasets < ActiveRecord::Migration[5.0]
  def up
    remove_index :datasets, name: 'index_datasets_on_connector_id'
    add_column :datasets, 'dateable_id', :integer
    add_column :datasets, 'dateable_type', :string
    remove_column :datasets, :connector_id
    add_index :datasets, ['dateable_id', 'dateable_type'], name: 'index_datasets_on_connector_and_connector_type', unique: true
  end

  def down
    remove_column :datasets, :dateable_id
    remove_column :datasets, :dateable_type
    add_column :datasets, :connector_id, :integer
    add_index :datasets, ['connector_id'], name: 'index_datasets_on_connector_id'
  end
end
