require_relative '../lib/deputy'

describe "The deput first name method" do
  it "should return something" do
  expect(get_deputy_first_name).not_to be_nil
  end
end

describe "The credentials catch method" do
  it "should retrive deputy's credentials" do
  expect(get_deputy_first_name("")).to eq(true)
  end
end