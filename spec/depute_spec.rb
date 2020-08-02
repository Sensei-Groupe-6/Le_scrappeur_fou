#!/usr/bin/env ruby


require_relative '../lib/depute'

describe "the names_mails method" do
  it "should return an array" do
    expect(names_mails).to be_instance_of Array
  end
  it "should not be nil" do
    expect(names_mails).not_to be_nil
  end
end
