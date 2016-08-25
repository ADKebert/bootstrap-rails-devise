class CreatePlots < ActiveRecord::Migration[5.0]
  def change
    create_table :plots do |t|
      t.references :user, foreign_key: true
      t.references :wheat, foreign_key: true

      t.timestamps
    end

    remove_column :wheats, :user_id
  end
end
