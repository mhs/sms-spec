require File.join(File.dirname(__FILE__), *%w[spec_helper])

describe TextSpec::Helpers do
  include TextSpec::Helpers

  before :each do
    TextSpec::Data.clear_messages
  end

  describe ".messages" do
    describe "before any messages have been sent" do
      it "is empty" do
        messages.should be_empty
      end
    end

    describe "after a message has been sent" do
      it "adds a message" do
        lambda {
          add_message Message.new :number => "5555555512", :body => "Hello there"
        }.should change(messages, :count).by(1)
      end
    end
  end

  describe ".set_current_number" do
    it "assigns the current number" do
      set_current_number "555551234"
      current_number.should == "555551234"
    end

    it "sanitizes phone nubmers" do
      set_current_number "+1555551234"
      current_number.should == "555551234"

      set_current_number "1-616-555-2929"
      current_number.should == "6165552929"
    end
  end

  describe ".clear_sms_messages" do
    it "removes all messages" do
      add_message Message.new :number => "5555555512", :body => "Hello there"
      add_message Message.new :number => "5555555512", :body => "Hello there"
      add_message Message.new :number => "5555555512", :body => "Hello there"

      messages.should have(3).messages
    end
  end

  describe ".current_text_message" do
    describe "when there are not text messages yet" do
    before :each do
      TextSpec::Data.clear_messages
    end

      it "returns nil" do
        current_text_message.should be_nil
      end
    end

    describe "when there are messages" do
      let(:message1) { Message.new :number => "5555555513", :body => "Hi" }
      let(:message2) { Message.new :number => "5555555512", :body => "Hello there" }

      before do
        add_message message1
        add_message message2
      end 

      describe "and no messages have been opened" do
        it "should be nil" do
          current_text_message.should be_nil
        end
      end

      describe "and a message has been opened" do
        before do
          open_last_text_message_for("5555555513")
        end

        it "returns the last open text message" do
          current_text_message.should == message1

          open_last_text_message_for("5555555513")
          current_text_message.should be_nil

          open_last_text_message_for("5555555512")
          current_text_message.should == message2
        end
      end
    end
  end

  describe ".twiml_message" do
    context "with defaults" do
      let(:message) {
        twiml_message("+16165559982", "Ahoy!")
      }

      it "modifies the From attribute" do
        message["From"].should eql("+16165559982")
      end

      it "Modifies the Body attribute" do
        message["Body"].should eql("Ahoy!")
      end
    end

    describe "Overriding options" do
      let(:message) {
        twiml_message("+16165559982", "Ahoy!", "ToZip" => "49506", "ToCity" => "Detroit")
      }

      it "overrides the specified attributes" do
        message["ToZip"].should eql("49506")
        message["ToCity"].should eql("Detroit")
        message["Body"].should eql("Ahoy!")
        message["From"].should eql("+16165559982")
      end
    end
  end

end
