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
        pending_reqs = PendingRequest.where(phone_number: phone_number)
        pending_reqs.map(&:keyword).each do |keyword|
          DRIP_CLIENT.create_or_update_subscriber(message)
          if keyword.tag.present?
            DRIP_CLIENT.apply_tag(message, keyword.tag)
          end

          if keyword.campaign.present?
            DRIP_CLIENT.subscribe(message, keyword.campaign)
          end
        end
      end
    end
  end
end
