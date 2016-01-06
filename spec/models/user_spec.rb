require 'rails_helper'

describe User do
  describe "email" do
    it "should exist" do
      user_without_email = build(:user, :email => nil)
      expect(user_without_email).to be_invalid

    end # end do

    it "should be greater than 5 characters" do
      small_email = build(:user, email: "a" * 5)
      expect(small_email).to be_invalid

    end

    it "should be less than 255 characters" do
      big_email = build(:user, email: "a" * 256)
      expect(big_email).to be_invalid

    end

    it "should be a properly formed email address" do
      invalid_email_array = [
                      "bro@nodomain",
                      "bro.noat",
                      "bro.asd@sda",
                      "bro@.nodomain",
                      "bro@no..main",
                      "bro@nomain."]

        valid_emails = [
                        "garrett.kerkkamp@gmail.com",
                        "bill_gates@microsoft.com",
                        "justine.trud@canada.ca",
                        "pacman99202@atari.tk"]



      invalid_email_array.each do |invalid_email|
        user = build(:user, email: invalid_email)
        expect(user).to be_invalid

      end # end invalid_email_array

      valid_emails.each do |valid_email|
        user = build(:user, email: valid_email)
        expect(user).to be_valid

      end # end valid_emails

    end # end format do

    it "should be a unique email" do

    end

 end # end email tests

  # placeholder
  describe "user_name" do
  end


end
