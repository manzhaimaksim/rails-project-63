# frozen_string_literal: true

# Tag for generating tags
module HexletCode
  module Tag
    def self.build(*args)
      case args[0]
      when "br"
        "<br>"
      when "img", "input"
        ["<#{args[0]}", "#{convert_hash_to_string(args[1])}>"].join
      when "label"
        if args[1].nil?
          ["<label>", yield, "</label>"].join
        else
          ["<label", "#{convert_hash_to_string(args[1])}>", "#{yield}</label>"].join
        end
      when "div"
        "<div></div>"
      else
        "No such tag exists"
      end
    end

    def self.convert_hash_to_string(hash)
      hash.map { |key, value| [" #{key}=", "\"#{value}\""] }.to_a.join
    end
  end
end
