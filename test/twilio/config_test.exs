defmodule Twilio.ConfigTest do
  use ExUnit.Case, async: true

  describe "account_sid/0" do
    test "reads from application env" do
      assert is_binary(Twilio.Config.account_sid())
      assert String.starts_with?(Twilio.Config.account_sid(), "AC")
    end
  end

  describe "auth_token/0" do
    test "reads from application env" do
      assert is_binary(Twilio.Config.auth_token())
      assert byte_size(Twilio.Config.auth_token()) > 0
    end
  end

  describe "max_retries/0" do
    test "defaults to 0" do
      assert Twilio.Config.max_retries() == 0
    end
  end

  describe "region/0" do
    test "defaults to nil" do
      assert Twilio.Config.region() == nil
    end
  end

  describe "edge/0" do
    test "defaults to nil" do
      assert Twilio.Config.edge() == nil
    end
  end
end
