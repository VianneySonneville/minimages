module ResizingConcern
  
  extend ActiveSupport::Concern

  def resizing_image(image_params)
    ActionDispatch::Http::UploadedFile.new({
      tempfile: begin
        ImageProcessing::Vips
          .source(image_params.tempfile)
          .convert(:webp)
          .resize_to_fit(600, 420)
          .call
        rescue
          ImageProcessing::MiniMagick
            .source(image_params.tempfile)
            .convert(:webp)
            .resize_to_fit(600, 420)
            .call
        end,
      type: "image/webp",
      head: "Content-Disposition: form-data; name='minimage[image]'",
      filename: "#{File.basename(image_params.original_filename, ".*")}.webp" 
    })

  rescue
    image_params
  end

  def base64_image(image_params)
    Base64.encode64(File.open(image_params.tempfile).read)
  rescue
    nil
  end
end
