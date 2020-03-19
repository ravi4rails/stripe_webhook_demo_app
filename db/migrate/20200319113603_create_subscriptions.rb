class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_subscription_id
      t.string :plan_id
      t.string :customer_id

      t.timestamps
    end
  end
end
