require 'finer_struct'
require 'shared_examples/struct'
require 'shared_examples/mutable'

describe "an anonymous mutable struct" do
  subject { FinerStruct::Mutable.new(a: 1, b: 2) }
  let(:identical) { FinerStruct::Mutable.new(a: 1, b: 2) }
  let(:different) { FinerStruct::Mutable.new(a: 3, b: 4) }

  it_behaves_like "a struct"
  it_behaves_like "a mutable struct"
end
