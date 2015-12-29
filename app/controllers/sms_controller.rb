class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def process_sms
    SmsWorker.perform_async(params["From"], params["Body"])
    render text: "success"
  end
end
