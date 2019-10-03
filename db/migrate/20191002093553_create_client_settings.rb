class CreateClientSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :client_settings do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :distributor, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
