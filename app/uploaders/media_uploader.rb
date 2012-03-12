# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
	storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #https://peekbox.s3.amazonaws.com/uploads/video/media/1/Homemade_Fireworks_-_Great_balls_of_fire.mp4
	def zencode(args)
		zencoder_response = Zencoder::Job.create({:input => "https://peekbox.s3.amazonaws.com/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/video.mp4",
                                              :output => [{:base_url => "https://peekbox.s3.amazonaws.com/uploads/video/attachment/#{@model.id}",
                                                           :filename => "video.mp4",
                                                           :label => "web",
                                                           :notifications => [zencoder_callback_url(:protocol => 'https')],
                                                           :video_codec => "h264",
                                                           :audio_codec => "aac",
                                                           :quality => 3,
                                                           :width => 854,
                                                           :height => 480,
                                                           :format => "mp4",
                                                           :aspect_mode => "preserve",
                                                           :public => 1}]
                                              })
 
    zencoder_response.body["outputs"].each do |output|
      if output["label"] == "web"
        @model.zencoder_output_id = output["id"]
        @model.processed = false
        @model.save(:validate => false)
      end
    end
  end

	def cache_dir
		"#{Rails.root}/tmp/uploads"
	end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(mp4)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
   def filename
     "video.mp4" if original_filename
   end

end
