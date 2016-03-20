shared_examples "a named struct" do
  it "complains if you set attributes that the struct doesn't have" do
    expect { klass.new(c: 3, d: 4) }.to raise_error(ArgumentError, "unknown attributes: c, d")
  end

  it "returns nil for attributes that aren't explicitly set" do
    expect(klass.new(a: 1).b).to be_nil
  end
end
