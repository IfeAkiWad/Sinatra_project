class CreateProductsTable < ActiveRecord::Migration[4.2]
    def change
        create_table :products do |t|
            t.string :name
            t.string :brand
            t.string :type
        end
    end
end