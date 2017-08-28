class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.integer :goal
      t.integer :pledged
      t.timestamp :deadline

      t.timestamps
    end
  end
end
