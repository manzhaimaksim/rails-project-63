# frozen_string_literal: true

# module Tag for generating tags
module HexletCode
  module Tag
    def self.build(tag, attributes = {})
      attrs = attributes.map do |key, value|
        "#{key}=\"#{value}\""
      end.join(' ')
      attrs = attrs.empty? ? '' : " #{attrs}"
      "<#{tag}#{attrs}#{block_given? ? ">#{yield}</#{tag}>" : ' />'}"
    end
  end
end
