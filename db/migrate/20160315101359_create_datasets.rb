class CreateDatasets < ActiveRecord::Migration[5.0]
  def up
    create_table :datasets do |t|
      t.integer :connector_id, foreign_key: true
      t.json    :table_columns
      t.string  :table_name
      t.integer :format, default: 1
      t.integer :row_count

      t.timestamps
    end

    add_index :datasets, :connector_id, name: 'index_datasets_on_connector_id', unique: true

    adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when :postgresql
      execute 'ALTER TABLE datasets ALTER COLUMN table_columns SET DATA TYPE jsonb USING table_columns::jsonb'
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end

  def down
    if ActiveRecord::Base.connection.table_exists? 'datasets'
      drop_table :datasets
    end
  end
end
