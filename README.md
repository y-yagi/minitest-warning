# Minitest::Warning

Show the number of Ruby warnings, and sets it to fail if there is a warning.

[![Build Status](https://travis-ci.org/y-yagi/minitest-warning.svg?branch=master)](https://travis-ci.org/y-yagi/minitest-warning)
[![Gem Version](https://badge.fury.io/rb/minitest-warning.svg)](http://badge.fury.io/rb/minitest-warning)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-warning'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-warning

## Usage

In your `test_helper.rb` file, add the following lines:

```ruby
require 'minitest/warning'
Minitest::Warning.enable!
```

```bash
$ ./bin/rails test
test/models/user_test.rb:5: warning: assigned but unused variable - a
Run options: --seed 33687

# Running:

........

Finished in 0.672513s, 11.8957 runs/s, 17.8435 assertions/s.

8 runs, 12 assertions, 0 failures, 0 errors, 0 skips, 1 warnings
$ echo $?
1
```

Options can be specified to `enable!` method. Can specify options are as follows:

```ruby
Minitest::Warning.enable!(
  path: "activejob-cancel"  # Only warnings matching path are targeted. The default is nil.
)
```
