After do
  SmsSpec::Data.clear_messages
end

World(SmsSpec::Helpers)
World(SmsSpec::Matchers)
