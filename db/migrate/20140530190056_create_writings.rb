class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :diagnosis
      t.string :treatment
      t.references :patient, index: true

      t.timestamps
    end
  end
end
