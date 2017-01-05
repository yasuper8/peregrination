class AddPostReferenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :post, foreign_key: true
  end
end