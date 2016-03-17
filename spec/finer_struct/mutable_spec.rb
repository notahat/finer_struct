require 'finer_struct/mutable'
require 'finer_struct/shared_examples'

shared_examples "a mutable struct" do
  it_behaves_like "a struct"
  it_behaves_like "a value object"

  it "lets you write attributes" do
    subject.a = 3
    expect(subject.a).to eq(3)
  end
end

module FinerStruct

  describe "an anonymous mutable struct" do
    subject { FinerStruct::Mutable.new(a: 1, b: 2) }

    it_behaves_like "a mutable struct"
  end

  describe "a named mutable struct" do
    let(:klass)  { Class.new(FinerStruct::Mutable(:a, :b)) }
    subject      { klass.new(a: 1, b: 2) }

    it_behaves_like "a mutable struct"
    it_behaves_like "a named struct"
  end

end
