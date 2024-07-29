# frozen_string_literal: true

require 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Form, 'hexlet_code/form.rb'

  def self.form_for(record, options = {})
    default_options = { action: options.fetch(:url, '#'), method: 'post' }

    form = Form.new(record)
    yield(form) if block_given?

    Tag.build('form', default_options.merge(options).except(:url)) { form.inputs.join }
  end
end
