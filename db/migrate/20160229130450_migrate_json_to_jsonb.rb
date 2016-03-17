class MigrateJsonToJsonb < ActiveRecord::Migration[5.0]
  def change
  	adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when :postgresql
      execute 'ALTER TABLE widgets ALTER COLUMN data SET DATA TYPE jsonb USING data::jsonb'
      execute 'ALTER TABLE widgets ALTER COLUMN chart SET DATA TYPE jsonb USING chart::jsonb'
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end
end
