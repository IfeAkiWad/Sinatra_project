class CreateUsersTable < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :username
            t.string :password
            t.string :subscription
        end
    end
end