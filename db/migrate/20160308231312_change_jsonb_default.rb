class ChangeJsonbDefault < ActiveRecord::Migration[5.0]
  def up
    adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when :postgresql
      execute "ALTER TABLE widgets ALTER COLUMN data SET DEFAULT '{}'::JSON"
      execute "ALTER TABLE widgets ALTER COLUMN chart SET DEFAULT '{}'::JSON"
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end

  def down
    adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when :postgresql
      execute "ALTER TABLE widgets ALTER COLUMN data SET DEFAULT null"
      execute "ALTER TABLE widgets ALTER COLUMN chart SET DEFAULT null"
    else
      raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
    end
  end
end
