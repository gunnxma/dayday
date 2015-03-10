require 'ftp_sync'
namespace :assets do
  desc 'sync assets to cdns'
  task :cdn => :environment do
    ftp = FtpSync.new(Settings.upyun_ftp_url, "#{Settings.upyun_username}/#{Settings.upyun_assets_bucket}", Settings.upyun_password,true)
    ftp.sync("#{Rails.root}/public/assets/", "/assets")
    ftp.sync("#{Rails.root}/public/uploads/", "/uploads")
  end
end