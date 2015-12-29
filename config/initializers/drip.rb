DRIP_CLIENT = Drip::Client.new do |c|
  c.api_key = DRIP_API_KEY
  c.account_id = DRIP_ACCOUNT_ID
end
