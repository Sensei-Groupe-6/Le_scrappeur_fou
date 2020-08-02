#!/usr/bin/env ruby


require_relative '../lib/dark_trader'

describe "the s_p_array method" do
  it "should return an array" do
    expect(s_p_array).to be_instance_of Array
  end
  it "should not be nil" do
    expect(s_p_array).not_to be_nil
  end
end
