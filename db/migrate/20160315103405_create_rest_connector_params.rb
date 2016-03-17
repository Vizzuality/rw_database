class CreateRestConnectorParams < ActiveRecord::Migration[5.0]
  def change
    create_table :rest_connector_params do |t|
      t.belongs_to :connector, index: true
      t.integer    :param_type, default: 1
      t.string     :key_name
      t.string     :value

      t.timestamps
    end
  end
end
