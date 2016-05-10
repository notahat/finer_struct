require 'finer_struct'
require 'shared_examples/struct'
require 'shared_examples/named'
require 'shared_examples/immutable'
require 'shared_examples/serializable'

describe "a named immutable struct" do
  TestNamedImmutableStruct = FinerStruct::Immutable(:a, :b)
  let(:klass) { TestNamedImmutableStruct }
  subject { klass.new(a: 1, b: 2) }
  let(:identical) { klass.new(a: 1, b: 2) }
  let(:different) { klass.new(a: 3, b: 4) }

  it_behaves_like "a struct"
  it_behaves_like "a named struct"
  it_behaves_like "an immutable struct"
  it_behaves_like "a serializable"
end
