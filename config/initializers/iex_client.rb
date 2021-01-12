@client = IEX::Api::Client.new(
    publishable_token: ENV["IEX_TOKEN"],
    secret_token: ENV["IEX_SECRET"],
    endpoint:'https://cloud.iexapis.com/v1'
    )