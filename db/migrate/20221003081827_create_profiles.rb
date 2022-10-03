class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :age
      t.string :occupation
      t.integer :experience

      t.timestamps
    end
  end
end
