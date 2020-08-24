class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :uid, null: false
      t.string :title, null: false
      t.string :author, null: false
      t.text :summary
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :books, :uid, unique: true
  end
end
