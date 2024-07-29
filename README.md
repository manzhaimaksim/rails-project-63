[![hexlet-check](https://github.com/manzhaimaksim/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/manzhaimaksim/rails-project-63/actions/workflows/hexlet-check.yml)
## Table of Contents

- [About HexletCode](#about-hexletcode)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)

## About HexletCode

HexletCode is a DSL that makes it easy to generate forms.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

The form generator internally creates various tags, such as `<input>`, `<label>`, `<form>` and others.

Single tag:
```ruby
HexletCode::Tag.build('br')
```
```html
<br>
```
Single tags with options:
```ruby
HexletCode::Tag.build('img', src: 'path/to/image')
```
```html
<img src="path/to/image">
```

```ruby
HexletCode::Tag.build('input', type: 'submit', value: 'Save')
```
```html
<input type="submit" value="Save">
```

For paired tags, the body is passed as a block:
```ruby
HexletCode::Tag.build('label') { 'Email' }
```
```html
<label>Email</label>
```
```ruby
HexletCode::Tag.build('label', for: 'email') { 'Email' }
```
```html
<label for="email">Email</label>
```
```ruby
HexletCode::Tag.build('div')
```
```html
<div></div>
```

Generate specific fields based on the data of the passed object.
```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```
```html
<form action="#" method="post">
  <input name="name" type="text" value="rob">
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>
```

For fields, you can specify additional attributes in the form of a hash as the last parameter.
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end
```
```html
<form action="#" method="post">
  <input name="name" type="text" value="rob" class="user-input">
  <input name="job" type="text" value="hexlet">
</form>
```

Fields may have default values ​​that can be overridden.
```ruby
HexletCode.form_for user do |f|
  f.input :job, as: :text
end
```
```html
<form action="#" method="post">
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>
```
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end
```
```html
<form action="#" method="post">
  <textarea cols="50" rows="50" name="job">hexlet</textarea>
</form>
```

The submit() method is used to submit the form. By default, this method uses the Save value as the button name, but you can override it by passing the desired text as the first argument.
```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end
```
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Save">
</form>
```

It is possible to specify text for the button
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job
  f.submit 'Wow'
end
```
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
  <input type="submit" value="Wow">
</form>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/manzhaimaksim/rails-project-63.git. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/manzhaimaksim/rails-project-63/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/manzhaimaksim/rails-project-63/blob/master/CODE_OF_CONDUCT.md).
