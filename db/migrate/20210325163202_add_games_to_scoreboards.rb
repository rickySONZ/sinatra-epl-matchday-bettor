class AddGamesToScoreboards < ActiveRecord::Migration[6.1]
  def change
    add_column :scoreboards, :game1, :string, default: nil
    add_column :scoreboards, :game2, :string, default: nil
    add_column :scoreboards, :game3, :string, default: nil
    add_column :scoreboards, :game4, :string, default: nil
    add_column :scoreboards, :game5, :string, default: nil
    add_column :scoreboards, :game6, :string, default: nil
    add_column :scoreboards, :game7, :string, default: nil
    add_column :scoreboards, :game8, :string, default: nil
    add_column :scoreboards, :game9, :string, default: nil
    add_column :scoreboards, :game10, :string, default: nil
  end
end
