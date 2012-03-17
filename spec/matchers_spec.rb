require File.join(File.dirname(__FILE__), *%w[spec_helper])

describe SmsSpec::Matchers do
  include SmsSpec::Helpers
  include SmsSpec::Matchers

  let(:mobile_number) { "5555555512" }

  class MatcherMatch
    def initialize(object_to_test_match)
      @object_to_test_match = object_to_test_match
    end

    def description
      "match when provided #{@object_to_test_match.inspect}"
    end

    def matches?(matcher)
      @matcher = matcher
      matcher.matches?(@object_to_test_match)
    end

    def failure_message
      "expected #{@matcher.inspect} to match when provided #{@object_to_test_match.inspect}, but it did not"
    end

    def negative_failure_message
      "expected #{@matcher.inspect} not to match when provided #{@object_to_test_match.inspect}, but it did"
    end
  end

  def match(object_to_test_match)
    if object_to_test_match.is_a?(Regexp)
      super # delegate to rspec's built in 'match' matcher
    else
      MatcherMatch.new(object_to_test_match)
    end
  end

  describe ".have_text_messages" do
    include SmsSpec::Matchers

    describe "when the mobile device has no text messages" do
      it "should not match" do
        device = MobileDevice.new(:number => mobile_number)
        have_text_messages.should_not match(device)
      end
    end

    describe "when the mobile device has text messages" do
      it "should match" do
        add_message Message.new(:number => mobile_number, :body => "something")

        device = MobileDevice.new(mobile_number)
        have_text_messages.should match(device)
      end
    end
  end

  describe ".have_body" do
    describe "when bodies match" do
      it "matches" do
        message = Message.new(:number => mobile_number, :body => "something")

        have_body("something").should match(message)
      end
    end
  end

end
