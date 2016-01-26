class SmsWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    keyword = Keyword.where(keyword: message.upcase).first

    if keyword
      PendingRequest.create(keyword: keyword, phone_number: phone_number)
      TWILIO_CLIENT.messages.create(
                                    from: ENV["TWILIO_PHONE_NUMBER"],
                                    to: phone_number,
                                    body: "Reply with your email address to get #{keyword.list_name}"
                                    )
    else
      if message.match VALID_EMAIL_REGEX
        pending_reqs = PendingRequest.where(phone_number: phone_number, handled: false)
        pending_reqs.each do |req|
          keyword = req.keyword
          DRIP_CLIENT.create_or_update_subscriber(message)
          if keyword.tag.present?
            DRIP_CLIENT.apply_tag(message, keyword.tag)
          end

          if keyword.campaign.present?
            DRIP_CLIENT.subscribe(message, keyword.campaign)
          end
          req.update_attribute(:handled, true)
        end
      end
    end
  end
end
