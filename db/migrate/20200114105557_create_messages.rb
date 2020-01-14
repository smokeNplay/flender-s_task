class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :amount

      t.timestamps
    end
  end
end
