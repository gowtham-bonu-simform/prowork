class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :duration
      t.string :title, index: true
      t.text :months
      t.string :experience
      t.text :hourly_rate
      t.decimal :project_budget
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
