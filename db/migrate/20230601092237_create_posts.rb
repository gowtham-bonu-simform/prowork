class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :duration
      t.string :title, index: true
      t.string :job_category
      t.string :skill, array: true, default: []
      t.integer :team_size
      t.integer :months
      t.string :experience_level
      t.text :hourly_rate
      t.decimal :project_budget
      t.text :description
      t.string :status
      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
