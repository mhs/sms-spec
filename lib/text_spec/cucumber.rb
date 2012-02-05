puts "Added text_spec helpers and matchers to world"


After do
  puts "clearing text_messages"
  TextSpec::Data.clear_messages
end

World(TextSpec::Helpers)
World(TextSpec::Matchers)
