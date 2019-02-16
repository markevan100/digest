class CreateDiscussionCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_categories do |t|
      t.integer :discussion_id
      t.integer :category_id
    end
  end
end
