Rails.application.config.middleware.use OmniAuth::Builder do
  # ...
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
  provider :qq_connect, ENV['QQ_CONNECT_APP_KEY'], ENV['QQ_CONNECT_APP_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}