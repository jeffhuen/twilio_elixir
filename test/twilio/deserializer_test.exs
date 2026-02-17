defmodule Twilio.DeserializerTest do
  use ExUnit.Case, async: true

  alias Twilio.Deserializer

  describe "deserialize/2" do
    test "converts a map to the given struct" do
      data = %{
        "sid" => "SM1234",
        "body" => "Hello",
        "status" => "delivered",
        "from" => "+15551234567",
        "to" => "+15559876543"
      }

      result = Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message)

      assert %Twilio.Resources.Api.V2010.Message{} = result
      assert result.sid == "SM1234"
      assert result.body == "Hello"
      assert result.status == "delivered"
      assert result.from == "+15551234567"
      assert result.to == "+15559876543"
    end

    test "sets missing fields to nil" do
      data = %{"sid" => "SM1234"}

      result = Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message)

      assert result.sid == "SM1234"
      assert result.body == nil
      assert result.status == nil
    end

    test "ignores extra keys not in the struct" do
      data = %{
        "sid" => "SM1234",
        "unknown_field" => "ignored",
        "another" => 42
      }

      result = Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message)

      assert result.sid == "SM1234"
    end

    test "handles integer fields" do
      data = %{"sid" => "SM1234", "error_code" => 30_001}

      result = Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message)

      assert result.error_code == 30_001
    end

    test "handles map fields (subresource_uris)" do
      uris = %{
        "media" => "/2010-04-01/Accounts/AC123/Messages/SM123/Media.json"
      }

      data = %{"sid" => "SM1234", "subresource_uris" => uris}

      result = Deserializer.deserialize(data, Twilio.Resources.Api.V2010.Message)

      assert result.subresource_uris == uris
    end
  end

  describe "deserialize_list/2" do
    test "converts a list of maps to structs" do
      items = [
        %{"sid" => "SM001", "body" => "First"},
        %{"sid" => "SM002", "body" => "Second"}
      ]

      results = Deserializer.deserialize_list(items, Twilio.Resources.Api.V2010.Message)

      assert length(results) == 2

      assert [
               %Twilio.Resources.Api.V2010.Message{sid: "SM001"},
               %Twilio.Resources.Api.V2010.Message{sid: "SM002"}
             ] = results
    end

    test "returns empty list for empty input" do
      assert Deserializer.deserialize_list([], Twilio.Resources.Api.V2010.Message) == []
    end
  end
end
