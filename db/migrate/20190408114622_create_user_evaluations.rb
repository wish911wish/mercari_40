class CreateUserEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_evaluations do |t|
      t.references :evaluator, null: false, foreign_key: { to_table: :users }
      t.references :evaluatee, null: false, foreign_key: { to_table: :users }
      t.integer :evaluation, null: false
      t.timestamps
    end
  end
end
