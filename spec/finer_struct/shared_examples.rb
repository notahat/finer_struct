shared_examples "a struct" do
  it "lets you read attributes" do
    expect(subject.a).to eq(1)
    expect(subject.b).to eq(2)
  end

  it "responds to attribute names" do
    expect(subject).to respond_to :a
    expect(subject).to respond_to :b
  end

  it "responds to :class" do
    expect(subject).to respond_to :class
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

shared_examples "a value object" do
  it "is equal to another object if it has the same values" do
    another_object = subject.class.new(a: 1, b: 2)

    expect(subject).to eq(another_object)
  end

  it "is not equal to another object if it has different values" do
    another_object = subject.class.new(a: 1, b: 3)

    expect(subject).not_to eq(another_object)
  end
end
