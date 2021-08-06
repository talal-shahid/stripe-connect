class CreateCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :credentials do |t|
      t.string :secret_key
      t.string :publishable_key
      t.string :client_id

      t.timestamps
    end
  end
end
