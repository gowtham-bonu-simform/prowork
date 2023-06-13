class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.string :proficiency, null: false
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
