class CreateBribes < ActiveRecord::Migration
  def change
    create_table :bribes do |t|
      t.integer :kind, :null => false
      t.integer :area, :null => false
      t.integer :service, :null => false
      t.date :when, :null => false
      t.decimal :amount, :precision => 9, :scale => 2, :null => false
      t.string :subject, :null => false
      t.text :description
      t.string :user
      t.datetime :validated_at

      t.timestamps
    end
  end
end
