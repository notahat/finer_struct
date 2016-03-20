shared_examples "a mutable struct" do
  it "lets you write attributes" do
    subject.a = 3
    expect(subject.a).to eq(3)
  end
end
