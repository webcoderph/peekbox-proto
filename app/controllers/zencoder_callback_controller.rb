class ZencoderCallbackController < ApplicationController
	skip_before_filter :verify_authenticity_token
 
  def create
    zencoder_response = ''
    sanitized_params = sanitize_params(params)
    sanitized_params.each do |key, value|
      zencoder_response = key.gsub('\"', '"')
    end
		puts " "
		puts "zencoder_response:"
		puts zencoder_response.inspect
		puts " "
		puts " "
 
    json = JSON(sanitized_params)
    output_id = json["output"]["id"]
    job_state = json["output"]["state"]
 
    video = Video.find_by_zencoder_output_id(output_id.to_s)
		puts " "
		puts " "
		puts "MM"
		puts "jobstate: #{job_state}. output_id: #{json['output'].inspect}"
		puts "MM"
		puts " "
		puts "MM"
		puts "jobstate: #{job_state}. output_id: #{json[zencoder_response]['output'].inspect}"
		puts "MM"
    if job_state == "finished" && video
      video.processed!
    end
 
    render :nothing => true
  end
 
  private
 
  def sanitize_params(params)
    params.delete(:action)
    params.delete(:controller)
    params
  end
end
