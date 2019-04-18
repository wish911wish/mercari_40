class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  after :store, :save_image_size
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def save_image_size(file)
    image_sizes = MiniMagick::Image.open(self.url).dimensions
    self.model.update(image_width: image_sizes[0], image_height: image_sizes[1])
  end
end
