require 'rails/generators'

module SmsSpec
  class StepsGenerator < Rails::Generators::Base
    def generate
      yopy_file 'sms_steps.rb', 'features/step_definitions/sms_steps.rb'
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end
  end
end

