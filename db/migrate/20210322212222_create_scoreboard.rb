class CreateScoreboard < ActiveRecord::Migration[6.1]
  def change
    create_table :scoreboards do |t|
      t.string :name
    end
  end
end
