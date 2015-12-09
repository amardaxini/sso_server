class AddSharedKeyToClientApp < ActiveRecord::Migration
  def change
    add_column :client_apps, :shared_key, :string
  end
end
