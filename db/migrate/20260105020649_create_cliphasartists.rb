class CreateCliphasartists < ActiveRecord::Migration[7.1]
  def change
    create_table :cliphasartists do |t|
      t.string :clip_id
      t.string :artist_id

      t.timestamps
    end
  end
end
