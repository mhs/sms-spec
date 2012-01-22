module TextSpec
  module Util
    def sanitize number
      number.gsub(/^\+*1/, "").gsub("-", "")
    end
  end
end
