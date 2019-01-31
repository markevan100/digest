class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :title
      t.text :answer
      t.references :user, foreign_key: true
      t.references :discussion, foreign_key: true

      t.timestamps
    end
  end
end
