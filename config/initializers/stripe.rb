Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_00Q5gvF7aZJeBh4kkCZuKhDk'],
  secret_key:      ENV['sk_test_QxHMJloYQmmE0Fp148A2C9FV']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
