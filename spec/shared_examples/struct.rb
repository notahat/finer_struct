shared_examples "a struct" do
  it "lets you read attributes" do
    expect(subject.a).to eq(1)
    expect(subject.b).to eq(2)
  end

  it "responds to attribute names" do
    expect(subject).to respond_to(:a)
    expect(subject).to respond_to(:b)
  end

  it "doesn't respond to attribute names that the struct doesn't have" do
    expect(subject).not_to respond_to(:c)
  end

  it "responds to non-attribute methods" do
    expect(subject).to respond_to(:class)
  end

  it "converts to a hash" do
    expect(subject.to_hash).to eq(a: 1 ,b: 2)
  end

  it "is equal to an identical struct" do
    expect(subject).to eq(identical)
  end

  it "is not equal to a different struct" do
    expect(subject).to_not eq(different)
  end

  it "is not equal to an object of a different class" do
    expect(subject).to_not eq("rhubarb")
  end
end
