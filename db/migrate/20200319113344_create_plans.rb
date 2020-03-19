class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :plan_price
      t.string :stripe_plan_id

      t.timestamps
    end
  end
end
