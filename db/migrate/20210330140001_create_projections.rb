class CreateProjections < ActiveRecord::Migration[6.1]
  def change
    create_table :projections do |t|
      t.string :player_name
      t.string :player_team
      t.float :goals
      t.float :assists
      t.float :points
      t.float :pp_points
      t.float :hits
      t.float :blocks
      t.float :pim
      t.float :fow
      t.float :sog
      t.references :leauge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
