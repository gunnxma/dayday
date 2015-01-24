require 'ftp_sync'
namespace :assets do
  desc 'sync assets to cdns'
  task :cdn => :environment do 
    ftp = FtpSync.new("v0.ftp.upyun.com", "xinqidou/xinqidou-assets", "macnmq1983",true)
    ftp.sync("#{Rails.root}/public/assets/", "/assets")
    ftp.sync("#{Rails.root}/public/uploads/", "/uploads")
  end
end