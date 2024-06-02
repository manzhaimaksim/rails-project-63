class FormContent
  ELEMENTS = {
    default: {
      tag: :input,
      value_position: :attribute,
      attributes: {
        type: 'text'
      }
    },
    text: {
      tag: :textarea,
      value_position: :inside,
      attributes: {
        cols: 20,
        rows: 40
      }
    },
    checkbox: {
      tag: :input,
      value_position: :attribute,
      attributes: {
        type: :checkbox
      }
    }
  }.freeze

  def initialize(fields_data, formatter)
    @formatter = formatter
    @fields_data = fields_data
    @all = ''
  end

  def input(field_name, attributes = {})
    element = ELEMENTS[attributes.fetch(:as, :default)]
    attributes.delete(:as)

    value = @fields_data.public_send(field_name)
    attrs = element[:attributes].merge(attributes, { name: field_name.to_s })

    @all += @formatter.build('label', { for: field_name }) { field_name.capitalize }

    @all += if element[:value_position] == :inside
              @formatter.build(element[:tag], attrs) { value }
            elsif element[:value_position] == :attribute
              attrs = attrs.merge({ value: })
              @formatter.build(element[:tag], attrs)
            end
  end
  # rubocop:enable Metrics/AbcSize

  def submit(text = 'Save')
    @all += @formatter.build(:input, { type: 'submit', value: text })
  end

  def to_s
    @all
  end
end
