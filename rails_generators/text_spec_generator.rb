base = defined?(Rails) ? Rails::Generator::Base : RubiGen::Base

class SmsSpecGenerator < base
  def manifest
    m.directory 'features/step_definitions'
    m.file 'text_message_steps.rb', 'features/step_definitions/text_message_steps.rb'
  end

  protected

  def banner
    "Usage: #{0} sms_spec"
  end
end
