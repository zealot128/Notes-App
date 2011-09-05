class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.text :html
      t.references :user

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
