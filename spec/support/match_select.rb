class TextSelector
  include ActionDispatch::Assertions::SelectorAssertions
  include Test::Unit::Assertions
  def initialize(text)
    @selected = HTML::Document.new(text).root.children
  end
end

RSpec::Matchers.define :match_select do |*expected|
  match do |actual|
    TextSelector.new(actual).assert_select(*expected)
  end
end