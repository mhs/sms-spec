require 'rails/generators'

module TextSpec
  class StepsGenerator < Rails::Generators::Base
    def generate
      copy_file 'text_message_steps.rb', 'features/step_definitions/text_message_steps.rb'
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end
  end
end

