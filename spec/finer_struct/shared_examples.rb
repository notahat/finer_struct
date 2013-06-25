shared_examples "a struct" do
  it "lets you read attributes" do
    expect(subject.a).to eq(1)
    expect(subject.b).to eq(2)
  end

  it "responds to attribute names" do
    expect(subject).to respond_to :a
    expect(subject).to respond_to :b
  end

  it "doesn't respond to attribute names that the struct doesn't have" do
    expect(subject).not_to respond_to :c
  end
end

shared_examples "a named struct" do
  it "complains if you set an attribute that the struct doesn't have" do
    expect { klass.new(c: 3) }.to raise_error(ArgumentError, "no such attribute: c")
  end
end
