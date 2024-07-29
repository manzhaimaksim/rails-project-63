# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new('User', :name, :job, :gender, keyword_init: true).new(name: 'rob', job: 'Hexlet', gender: 'm')
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_form_is_created_without_url
    expected = '<form action="#" method="post"></form>'
    actual = HexletCode.form_for @user

    assert_equal(expected, actual)
  end

  def test_that_form_is_created_with_url
    expected = '<form action="/users" method="post"></form>'
    actual = HexletCode.form_for @user, action: '/users'

    assert_equal(expected, actual)
  end

  def test_that_the_passed_fields_are_generated
    # rubocop:disable Layout/LineLength
    expected = '<form action="#" method="post"><label for="name">Name</label><input type="text" name="name" value="rob"><label for="job">Job</label><textarea cols="20" rows="40" name="job">Hexlet</textarea></form>'
    # rubocop:enable Layout/LineLength
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal(expected, actual)
  end

  def test_that_additional_arguments_can_be_passed_as_a_hash
    # rubocop:disable Layout/LineLength
    expected = '<form action="#" method="post"><label for="name">Name</label><input type="text" class="user-input" name="name" value="rob"><label for="job">Job</label><input type="text" name="job" value="Hexlet"></form>'
    # rubocop:enable Layout/LineLength
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal(expected, actual)
  end

  def test_that_default_values_can_be_overridden
    # rubocop:disable Layout/LineLength
    expected = '<form action="#" method="post"><label for="job">Job</label><textarea cols="50" rows="50" name="job">Hexlet</textarea></form>'
    # rubocop:enable Layout/LineLength
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal(expected, actual)
  end

  def test_that_submit_button_is_generated
    # rubocop:disable Layout/LineLength
    expected = '<form action="#" method="post"><label for="name">Name</label><input type="text" name="name" value="rob"><label for="job">Job</label><input type="text" name="job" value="Hexlet"><input type="submit" value="Save"></form>'
    # rubocop:enable Layout/LineLength
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal(expected, actual)
  end

  def test_that_submit_button_is_generated_with_text
    # rubocop:disable Layout/LineLength
    expected = '<form action="#" method="post"><label for="name">Name</label><input type="text" name="name" value="rob"><label for="job">Job</label><input type="text" name="job" value="Hexlet"><input type="submit" value="Wow"></form>'
    # rubocop:enable Layout/LineLength
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal(expected, actual)
  end
end
