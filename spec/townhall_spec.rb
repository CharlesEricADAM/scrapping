require_relative '../lib/townhall'

describe "The get townhall emails method" do
  it "should return something" do
  expect(get_townhall_email).not_to be_nil
  end
end

describe "The get townhal URLs method" do
  it "should return emails for each townhall" do
  expect(get_townhall_email).to eq([])
  end
end
