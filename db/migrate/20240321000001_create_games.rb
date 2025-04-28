# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :player_one, null: false, foreign_key: { to_table: :players }
      t.references :player_two, null: false, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
