require 'finer_struct/immutable'

module FinerStruct

  describe Immutable do
    let(:struct) { described_class.new(a: 1, b: 2) }

    it "lets you read attributes" do
      expect(struct.a).to eq(1)
      expect(struct.b).to eq(2)
    end

    it "complains if you try to write an attribute" do
      expect { struct.a = 3 }.to raise_error(NoMethodError)
    end
  end

  describe "Immutable class" do
    let(:klass)  { FinerStruct::Immutable(:a, :b) }
    let(:struct) { klass.new(a: 1, b: 2) }

    it "lets you read attributes" do
      expect(struct.a).to eq(1)
      expect(struct.b).to eq(2)
    end

    it "complains if you try to write an attribute" do
      expect { struct.a = 3 }.to raise_error(NoMethodError)
    end

    it "complains if you set an attribute that the struct doesn't have" do
      expect { klass.new(c: 3) }.to raise_error(ArgumentError, "no such attribute: c")
    end
  end

end
