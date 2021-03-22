class AddUserToScoreboard < ActiveRecord::Migration[6.1]
  def change
    add_reference :scoreboards, :user
  end
end
