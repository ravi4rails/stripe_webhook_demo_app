Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.application.credentials[:stripe][:stripe_signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'product.', Stripe::InvoiceEventHandler.new
end