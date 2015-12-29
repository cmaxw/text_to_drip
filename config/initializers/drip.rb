DRIP_CLIENT = Drip::Client.new do |c|
  c.api_key = ENV['DRIP_API_KEY']
  c.account_id = ENV["DRIP_ACCOUNT_ID"]
end
