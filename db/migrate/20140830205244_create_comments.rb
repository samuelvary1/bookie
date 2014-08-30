class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :match

      t.timestamps
    end
    add_index :comments, :match_id
  end
end
