class CreateMusicalPieces < ActiveRecord::Migration[7.1]
  def change
    create_table :musical_pieces do |t|
      t.string :name

      t.timestamps
    end
  end
end
