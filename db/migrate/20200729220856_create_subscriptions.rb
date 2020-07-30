class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :cost
      t.string :frequency
    end
  end
end
