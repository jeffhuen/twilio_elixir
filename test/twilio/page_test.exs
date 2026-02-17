defmodule Twilio.PageTest do
  use ExUnit.Case, async: true

  alias Twilio.Page

  describe "from_response/2 — meta wrapper format (v1/v2/v3)" do
    test "parses meta-wrapped response" do
      data = %{
        "credentials" => [
          %{"sid" => "CR001", "friendly_name" => "Key 1"},
          %{"sid" => "CR002", "friendly_name" => "Key 2"}
        ],
        "meta" => %{
          "page" => 0,
          "page_size" => 50,
          "first_page_url" => "/v1/Credentials?PageSize=50&Page=0",
          "next_page_url" => "/v1/Credentials?PageSize=50&Page=1&PageToken=abc",
          "previous_page_url" => nil,
          "url" => "/v1/Credentials?PageSize=50&Page=0",
          "key" => "credentials"
        }
      }

      page = Page.from_response(data, "credentials")

      assert %Page{} = page
      assert length(page.items) == 2
      assert page.page == 0
      assert page.page_size == 50
      assert page.next_page_url == "/v1/Credentials?PageSize=50&Page=1&PageToken=abc"
      assert page.previous_page_url == nil
      assert page.key == "credentials"
    end
  end

  describe "from_response/2 — flat format (v2010)" do
    test "parses flat response with *_uri fields" do
      data = %{
        "messages" => [
          %{"sid" => "SM001", "body" => "Hello"}
        ],
        "page" => 0,
        "page_size" => 50,
        "first_page_uri" => "/2010-04-01/Accounts/AC123/Messages.json?Page=0",
        "next_page_uri" => "/2010-04-01/Accounts/AC123/Messages.json?Page=1&PageToken=xyz",
        "previous_page_uri" => nil,
        "uri" => "/2010-04-01/Accounts/AC123/Messages.json?Page=0"
      }

      page = Page.from_response(data, "messages")

      assert %Page{} = page
      assert length(page.items) == 1
      assert page.page == 0
      assert page.page_size == 50
      # Flat format maps *_uri to *_url fields on the struct
      assert page.next_page_url == "/2010-04-01/Accounts/AC123/Messages.json?Page=1&PageToken=xyz"
      assert page.previous_page_url == nil
      assert page.key == "messages"
    end
  end

  describe "has_next?/1" do
    test "returns true when next_page_url is set" do
      page = %Page{items: [], key: "items", next_page_url: "/next"}
      assert Page.has_next?(page)
    end

    test "returns false when next_page_url is nil" do
      page = %Page{items: [], key: "items", next_page_url: nil}
      refute Page.has_next?(page)
    end
  end

  describe "stream/2" do
    test "streams items from a single page" do
      page = %Page{
        items: [%{"sid" => "SM001"}, %{"sid" => "SM002"}],
        key: "messages",
        next_page_url: nil
      }

      fetch_fn = fn %{} -> {:ok, page} end

      results = Page.stream(fetch_fn, "messages") |> Enum.to_list()

      assert results == [%{"sid" => "SM001"}, %{"sid" => "SM002"}]
    end

    test "streams items across multiple pages" do
      page1 = %Page{
        items: [%{"sid" => "SM001"}],
        key: "messages",
        next_page_url: "/messages?Page=1&PageToken=abc"
      }

      page2 = %Page{
        items: [%{"sid" => "SM002"}],
        key: "messages",
        next_page_url: nil
      }

      call_count = :counters.new(1, [])

      fetch_fn = fn _params ->
        count = :counters.get(call_count, 1)
        :counters.add(call_count, 1, 1)
        if count == 0, do: {:ok, page1}, else: {:ok, page2}
      end

      results = Page.stream(fetch_fn, "messages") |> Enum.to_list()

      assert results == [%{"sid" => "SM001"}, %{"sid" => "SM002"}]
    end

    test "stops on error" do
      fetch_fn = fn _params -> {:error, %Twilio.Error{message: "fail"}} end

      results = Page.stream(fetch_fn, "items") |> Enum.to_list()

      assert results == []
    end
  end
end
