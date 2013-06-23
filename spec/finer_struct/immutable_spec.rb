require 'finer_struct/immutable'
require 'finer_struct/shared_examples'

shared_examples "an immutable struct" do
  it_behaves_like "a struct"

  it "complains if you try to write an attribute" do
    expect { subject.a = 3 }.to raise_error(NoMethodError)
  end
end

module FinerStruct

  describe "an anonymouse immutable struct" do
    subject { FinerStruct::Immutable.new(a: 1, b: 2) }

    it_behaves_like "an immutable struct"
  end

  describe "a named immutable struct" do
    let(:klass)  { FinerStruct::Immutable(:a, :b) }
    subject      { klass.new(a: 1, b: 2) }

    it_behaves_like "an immutable struct"

    it "complains if you set an attribute that the struct doesn't have" do
      expect { klass.new(c: 3) }.to raise_error(ArgumentError, "no such attribute: c")
    end
  end

end
