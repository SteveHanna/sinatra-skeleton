class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :title

      t.references :article, foreign_key: true
    end
  end
end
