# encoding: utf-8
IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(60x60 150x150 800x800)
class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  #include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :upyun
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #  "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    #{}"fallback/default.jpeg"
    "http://image.xinqidou.com/fallback/default.jpeg#{version_name}"
  end

  def url(version_name = "")
    @url ||= super({})
    version_name = version_name.to_s
    return @url if version_name.blank?
    if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
      # To protected version name using, when it not defined, this will be give an error message in development environment
      raise "ImageUploader version_name:#{version_name} not allow."
    end
    [@url,version_name].join("!") # thumb split with "!"
  end

  # Process files as they are uploaded:
  # process :scale => [800, 800]
  #
  # def scale(width, height)
  #   # do something
  # end

  #process :resize_to_fit => [800, 800]

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  #def filename
  #  if super.present?
  #    #model.uploader_secure_token ||= SecureRandom.uuid.gsub("-","")
  #    token = SecureRandom.uuid.gsub("-","")
  #    #Rails.logger.debug("(BaseUploader.filename) #{model.uploader_secure_token}")
  #    #"#{model.uploader_secure_token}.#{file.extension.downcase}"
  #    "#{token}.#{file.extension.downcase}"
  #  end
  #end

end
