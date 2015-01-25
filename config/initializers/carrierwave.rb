CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "xinqidou"
  config.upyun_password = 'macnmq1983'
  config.upyun_bucket = "xinqidou"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://image.xinqidou.com"
end