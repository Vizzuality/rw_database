class CreateLayers < ActiveRecord::Migration[5.0]
  def change
    create_table :layers do |t|
      t.belongs_to :widget, index: true, foreign_key: true
      t.integer :provider, null: false, default: 0
      t.json :options, null: false
      t.timestamps
    end

    adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when :postgresql
      execute 'ALTER TABLE layers ALTER COLUMN options SET DATA TYPE jsonb USING options::jsonb'
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end
end
