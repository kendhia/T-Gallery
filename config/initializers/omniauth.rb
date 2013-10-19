OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '158698014311580', '0f23a5e8055fbc0e57e3a0aeb3efdf0f'
end

