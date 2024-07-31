all: install lint test
.PHONY: all

install:
	bundle install
lint:
	bundle exec rubocop
test:
	rake test
