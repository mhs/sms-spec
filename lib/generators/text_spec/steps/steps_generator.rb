require 'rails/generators'

module TextSpec
  class StepsGenerator < Rails::Generators::Base
    def generate
      copy_file 'text_steps.rb', 'features/step_definitions/text_steps.rb'
    end

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end
  end
end

