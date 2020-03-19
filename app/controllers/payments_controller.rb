class PaymentsController < ApplicationController
  def create
    @user = User.find(params[:payment][:user_id])
    @stripe = StripeUsage.new
    card_token = params[:card_token]
    if @user.stripe_customer_token.present?
      @customer = @stripe.find_customer(@user.stripe_customer_token)
    else
      @customer = @stripe.create_customer(@user.email, card_token)
      @user.update(stripe_customer_token: @customer.id)
    end
    # create charges
    @charges = @stripe.create_charge(5000, 'usd', 'Test Payment', @customer.id)

    # create plan
    @stripe_plan = @stripe.create_plan
    @plan =  Plan.update(stripe_plan_id: @stripe_plan.id)

    # create Subscription
    @strip_subscription = @stripe.create_subscription(@customer.id, @stripe_plan.id)
    @sub = Subscription.update(plan_id: @stripe_plan.id, customer_id: @customer.id, stripe_subscription_id: @strip_subscription.id)

    redirect_to root_path,  notice: "You are sucessfully verified your account.now you can create listings and purchase instruments"
  end
end
