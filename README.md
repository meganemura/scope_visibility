# ScopeVisibility

```ruby
gem 'scope_visibility'
```

## Usage

```ruby
class MyClass
  extend ScopeVisibility::VisibilityMethods

  puts scope_visibility_public? # => true
  puts scope_visibility # => :public

  private

  puts scope_visibility_private? # => true
  puts scope_visibility # => :private

  protected

  puts scope_visibility_protected? # => true
  puts scope_visibility # => :protected
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meganemura/scope_visibility.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
