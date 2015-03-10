CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = Settings.upyun_username
  config.upyun_password = Settings.upyun_password
  config.upyun_bucket = Settings.upyun_bucket
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = Settings.upyun_bucket_host
end