class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :post

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
