base = defined?(Rails) ? Rails::Generator::Base : RubiGen::Base

class SmsSpecGenerator < base
  def manifest
    m.directory 'features/step_definitions'
    m.file 'sms_steps.rb', 'features/step_definitions/sms_steps.rb'
  end

  protected

  def banner
    "Usage: #{0} sms_spec"
  end
end
