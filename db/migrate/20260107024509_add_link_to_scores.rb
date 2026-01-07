class AddLinkToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :link, :string
  end
end
