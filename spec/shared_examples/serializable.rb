require 'yaml'

shared_examples "a serializable" do
  it "can be serialized and de-serialized via YAML" do
    serialized = YAML.dump(subject)
    deserialized = YAML.load(serialized)
    expect(deserialized).to eq(subject)
  end

  it "can be serialized and de-serialized via binary" do
    serialized = Marshal.dump(subject)
    deserialized = Marshal.load(serialized)
    expect(deserialized).to eq(subject)
  end
end
