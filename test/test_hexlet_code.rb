# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new("User", :name, :job, keyword_init: true).new name: "rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_form_is_created_without_url
    assert HexletCode.form_for @user == "<form action=\"#\" method=\"post\"></form>"
  end

  def test_that_form_is_created_with_url
    assert (HexletCode.form_for @user, url: "/users") == "<form action=\"/users\" method=\"post\"></form>"
  end
end
