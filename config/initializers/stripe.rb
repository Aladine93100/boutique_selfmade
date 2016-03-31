Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_DUxVXeysgjEC3xnWJ6AeyG2P'],
  :secret_key      => ENV['sk_test_8sanX8R5wAlzi3seZ0SSugFK']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]