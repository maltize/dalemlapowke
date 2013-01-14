class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :bribe_id, :null => false
      t.text :comment, :null => false
      t.string :user
      t.datetime :validated_at

      t.timestamps
    end

    add_index :comments, :bribe_id
    add_index :comments, :validated_at
  end
end
