# frozen_string_literal: true

require_relative 'hexlet_code/version'

# module HexletCode for generating tags
module HexletCode
  autoload :Tag, 'tag.rb'
  autoload :FormContent, 'form_content.rb'

  def self.form_for(fields_data = {}, attributes = {})
    url = (attributes.is_a?(Hash) ? attributes.fetch(:url, '#') : attributes)
    attrs = { action: url, method: 'post' }
    attrs.merge!(attributes) if attributes.is_a?(Hash)
    attrs.delete(:url)
    content = FormContent.new(fields_data, Tag)
    yield(content) if block_given?
    Tag.build('form', attrs) { content if block_given? }
  end
end
