Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials[:stripe][:stripe_publishable_key],
  secret_key:      Rails.application.credentials[:stripe][:stripe_secret_key]
}
StripeEvent.signing_secret = Rails.application.credentials[:stripe][:stripe_signing_secret]
Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.configure do |events|
 events.subscribe 'charge.dispute.created', Stripe::EventHandler.new
end
