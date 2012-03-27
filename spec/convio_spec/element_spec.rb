# encoding: utf-8
require File.expand_path("../../watirspec/spec_helper", __FILE__)

describe "Element" do

  before :each do
    browser.goto(WatirSpec.url_for("forms_with_input_elements.html"))
  end

  describe "#next_sibling" do
    it "gets the next sibling of this element" do
      sib = browser.text_field(:id, "new_user_email").next_sibling.next_sibling
      sib.should be_instance_of(Label)
      sib.text.should == 'Country'
    end

    it "returns nil if the element has no next sibling" do
      browser.file_field(:id, "new_user_teeth").next_sibling.should be_nil
    end
  end

  describe "#previous_sibling" do
    it "gets the previous sibling of this element" do
      sib = browser.text_field(:id, "new_user_email").previous_sibling
      sib.should be_instance_of(Label)
      sib.text.should == 'Email address'
    end

    it "returns nil if the element has no previous sibling" do
      browser.legend(:text, "Personal information").previous_sibling.should be_nil
    end
  end
end