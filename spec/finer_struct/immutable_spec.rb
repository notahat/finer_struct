require 'finer_struct/immutable'
require 'finer_struct/shared_examples'

shared_examples "an immutable struct" do
  it_behaves_like "a struct"

  it "complains if you try to write an attribute" do
    expect { subject.a = 3 }.to raise_error(NoMethodError)
  end

  it "is frozen" do
    expect(subject).to be_frozen
  end

  it "converts to a frozen hash" do
    expect(subject.to_hash).to be_frozen
  end
end

module FinerStruct

  describe "an anonymous immutable struct" do
    subject { FinerStruct::Immutable.new(a: 1, b: 2) }

    it_behaves_like "an immutable struct"
  end

  describe "a named immutable struct" do
    let(:klass)  { Class.new(FinerStruct::Immutable(:a, :b)) }
    subject      { klass.new(a: 1, b: 2) }

    it_behaves_like "an immutable struct"
    it_behaves_like "a named struct"
  end

end
