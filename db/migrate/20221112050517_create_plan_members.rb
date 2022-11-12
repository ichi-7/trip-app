class CreatePlanMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_members do |t|
      t.integer :user_id
      t.integer :plan_id
      t.timestamps
    end
  end
end
