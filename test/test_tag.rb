# frozen_string_literal: true

require 'test_helper'

class TestTag < Minitest::Test
  def test_that_a_single_tag_is_created
    expected = '<br>'
    actual = HexletCode::Tag.build('br')

    assert_equal(expected, actual)
  end

  def test_that_a_single_tag_with_an_attribute_is_created
    expected = '<img src="path/to/image">'
    actual = HexletCode::Tag.build('img', src: 'path/to/image')

    assert_equal(expected, actual)
  end

  def test_that_a_single_tag_with_attributes_is_created
    expected = '<input type="submit" value="Save">'
    actual = HexletCode::Tag.build('input', type: 'submit', value: 'Save')

    assert_equal(expected, actual)
  end

  def test_that_a_paired_tag_with_a_block_is_created
    expected = '<label>Email</label>'
    actual = HexletCode::Tag.build('label') { 'Email' }

    assert_equal(expected, actual)
  end

  def test_that_a_paired_tag_with_attributes_and_a_block_is_created
    expected = '<label for="email">Email</label>'
    actual = HexletCode::Tag.build('label', for: 'email') { 'Email' }

    assert_equal(expected, actual)
  end

  def test_that_a_paired_tag_is_created
    expected = '<div></div>'
    actual = HexletCode::Tag.build('div')

    assert_equal(expected, actual)
  end
end
