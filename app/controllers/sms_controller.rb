class SmsController < ApplicationController
  def process_sms
    SmsWorker.perform_async(params["From"], params["Body"])
  end
end
