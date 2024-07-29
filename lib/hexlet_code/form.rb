# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :inputs

    def initialize(record)
      @record = record
      @inputs = []
    end

    def input(name, options = {})
      options[:name] = name
      value = @record.public_send(name)
      @inputs << Tag.build('label', { for: name }) { name.capitalize }
      if options.key?(:as)
        @inputs << Tag.build('textarea', { cols: 20, rows: 40 }.merge(options).except(:as)) { value }
      else
        options[:value] = value
        @inputs << Tag.build('input', { type: 'text' }.merge(options).except(:as))
      end
    end

    def submit(value = 'Save', options = {})
      @inputs << Tag.build('input', options.merge({ type: 'submit', value: }))
    end
  end
end
