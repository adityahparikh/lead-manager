class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :subdomain
      
      t.timestamps null: false
    end
  end
end
