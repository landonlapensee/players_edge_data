class CreateProjections < ActiveRecord::Migration[6.1]
  def change
    create_table :projections do |t|
      t.string :player
      t.integer :age
      t.string :pos
      t.string :team
      t.float :toi_org_es

      t.timestamps
    end
  end
end
