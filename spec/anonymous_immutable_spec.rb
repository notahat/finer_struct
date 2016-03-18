require 'finer_struct'
require 'shared_examples/struct'
require 'shared_examples/immutable'

describe "an anonymous immutable struct" do
  subject { FinerStruct::Immutable.new(a: 1, b: 2) }
  let(:identical) { FinerStruct::Immutable.new(a: 1, b: 2) }
  let(:different) { FinerStruct::Immutable.new(a: 3, b: 4) }

  it_behaves_like "a struct"
  it_behaves_like "an immutable struct"
end
