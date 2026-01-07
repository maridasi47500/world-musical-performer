class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.string :title
      t.string :composer
      t.string :musicalinstrument_id
      t.string :scores

      t.timestamps
    end
  end
end
