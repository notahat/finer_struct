shared_examples "an immutable struct" do
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
