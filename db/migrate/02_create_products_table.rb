class CreateProductsTable < ActiveRecord::Migration
    def change
        create_table :products do |t|
            t.string :name
            t.string :brand
            t.string :type
        end
    end
end