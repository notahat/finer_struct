shared_examples "a struct" do
  it "lets you read attributes" do
    expect(subject.a).to eq(1)
    expect(subject.b).to eq(2)
  end
end
