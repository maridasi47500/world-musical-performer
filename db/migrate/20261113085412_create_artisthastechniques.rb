class CreateArtisthastechniques < ActiveRecord::Migration[8.1]
  def change
    create_table :artisthastechniques do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :technique_name
      t.string :difficulty

      t.timestamps
    end
  end
end
