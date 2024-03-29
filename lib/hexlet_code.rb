# frozen_string_literal: true

require_relative "hexlet_code/version"

# module HexletCode for generating tags
module HexletCode
  autoload(:Tag, "./lib/tag.rb")

  def self.form_for(*args)
    if args[1].nil?
      "<form action=\"#\" method=\"post\"></form>"
    else
      "<form action=\"#{args[1][:url]}\" method=\"post\"></form>"
    end
  end
end
