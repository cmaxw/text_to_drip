class SmsController < ApplicationController
  def process
    SmsWorker.perform_async(params["From"], params["Body"])
  end
end
