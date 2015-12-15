class SmsController < ApplicationController
  def process
    Rails.logger.info params.inspect
  end
end
