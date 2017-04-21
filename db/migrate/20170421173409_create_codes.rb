class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :secret_code, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
