# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[input img br].freeze

    def self.build(tag, attributes = {})
      tag_attributes = convert_attributes(attributes)
      return "<#{tag}#{tag_attributes}>" if SINGLE_TAGS.include?(tag)

      body = yield if block_given?
      "<#{tag}#{tag_attributes}>#{body}</#{tag}>"
    end

    def self.convert_attributes(attributes)
      attributes.map do |key, value|
        " #{key}=\"#{value}\""
      end.join('')
    end
  end
end
