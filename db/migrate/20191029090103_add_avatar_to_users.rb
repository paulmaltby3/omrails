class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  
  def up
    add_attachment :users, :avatar, :image
  end
 
  def down
    remove_attachment :users, :avatar, :image
  end
  
end  