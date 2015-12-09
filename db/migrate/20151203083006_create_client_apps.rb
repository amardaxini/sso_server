class CreateClientApps < ActiveRecord::Migration
  def change
    create_table :client_apps do |t|
      t.string :name
      t.string :subdomain
      t.string :tenant_name

      t.timestamps null: false
    end
  end
end
