defmodule Twilio.Generator.ServiceGeneratorTest do
  # async: false because we compile a fresh module into the VM per test run
  use ExUnit.Case, async: false

  alias Twilio.Generator.ServiceGenerator

  @resource %{
    name: "Widget",
    nesting: [],
    description: "Test widgets.",
    operations: [
      %{
        name: :create,
        method: :post,
        path: "/2010-04-01/Widgets.json",
        content_type: :form,
        description: nil,
        operation_id: "CreateWidget",
        tags: [],
        request_params: [],
        query_params: []
      },
      %{
        name: :list,
        method: :get,
        path: "/2010-04-01/Widgets.json",
        content_type: :form,
        description: nil,
        operation_id: "ListWidget",
        tags: [],
        request_params: [],
        query_params: []
      },
      %{
        name: :fetch,
        method: :get,
        path: "/2010-04-01/Widgets/{Sid}.json",
        content_type: :form,
        description: nil,
        operation_id: "FetchWidget",
        tags: [],
        request_params: [],
        query_params: []
      },
      %{
        name: :update,
        method: :post,
        path: "/2010-04-01/Widgets/{Sid}.json",
        content_type: :json,
        description: nil,
        operation_id: "UpdateWidget",
        tags: [],
        request_params: [],
        query_params: []
      },
      %{
        name: :delete,
        method: :delete,
        path: "/2010-04-01/Widgets/{Sid}.json",
        content_type: :form,
        description: nil,
        operation_id: "DeleteWidget",
        tags: [],
        request_params: [],
        query_params: []
      }
    ],
    properties: [],
    sid_param: "Sid",
    page_key: "widgets",
    path_params: [],
    parent: nil,
    schema_name: nil,
    schema_description: nil,
    sid_prefix: nil,
    default_output_properties: [],
    dependent_properties: []
  }

  @default_base_url "https://api.twilio.com"

  setup_all do
    source =
      @resource
      |> ServiceGenerator.generate("GenTest", "V1", @default_base_url)
      |> Code.format_string!()
      |> IO.iodata_to_binary()

    [{mod, _bin}] = Code.compile_string(source)
    {:ok, service: mod}
  end

  setup do
    client = Twilio.Client.new("ACtest", "token")
    {:ok, client: client}
  end

  describe "generated source structure" do
    test "no longer wraps caller opts under a nested :opts key" do
      source = ServiceGenerator.generate(@resource, "GenTest", "V1", @default_base_url)
      refute source =~ "opts: opts"
    end

    test "uses Keyword.put_new for base_url so callers can override it" do
      source = ServiceGenerator.generate(@resource, "GenTest", "V1", @default_base_url)
      assert source =~ ~s|Keyword.put_new(:base_url, "https://api.twilio.com")|
    end

    test "uses Keyword.put for params so caller's explicit arg always wins" do
      source = ServiceGenerator.generate(@resource, "GenTest", "V1", @default_base_url)
      assert source =~ "Keyword.put(:params, params)"
    end
  end

  describe "caller-supplied :base_url is honored end-to-end" do
    test "create/3 redirects to override host", %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {200, [{"content-type", "application/json"}], "{}"}
      end)

      assert {:ok, _} =
               service.create(client, %{"Name" => "test"}, base_url: "http://localhost:4567")

      assert_receive {:url, url}
      assert String.starts_with?(url, "http://localhost:4567/")
      refute url =~ "api.twilio.com"
    end

    test "list/3 redirects to override host", %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {200, [{"content-type", "application/json"}], ~s({"widgets": []})}
      end)

      assert {:ok, _} = service.list(client, %{}, base_url: "http://localhost:4567")

      assert_receive {:url, url}
      assert String.starts_with?(url, "http://localhost:4567/")
    end

    test "fetch/3 redirects to override host", %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {200, [{"content-type", "application/json"}], "{}"}
      end)

      assert {:ok, _} = service.fetch(client, "WG123", base_url: "http://localhost:4567")

      assert_receive {:url, url}
      assert String.starts_with?(url, "http://localhost:4567/")
    end

    test "update/4 redirects to override host", %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {200, [{"content-type", "application/json"}], "{}"}
      end)

      assert {:ok, _} =
               service.update(client, "WG123", %{"Name" => "x"},
                 base_url: "http://localhost:4567"
               )

      assert_receive {:url, url}
      assert String.starts_with?(url, "http://localhost:4567/")
    end

    test "delete/3 redirects to override host", %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {204, [], ""}
      end)

      assert :ok = service.delete(client, "WG123", base_url: "http://localhost:4567")

      assert_receive {:url, url}
      assert String.starts_with?(url, "http://localhost:4567/")
    end

    test "default base_url is used when caller omits the option",
         %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, url, _headers, _body ->
        send(test_pid, {:url, url})
        {200, [{"content-type", "application/json"}], "{}"}
      end)

      assert {:ok, _} = service.fetch(client, "WG123")

      assert_receive {:url, url}
      assert String.starts_with?(url, "https://api.twilio.com/")
    end
  end

  describe "caller's :params in opts is ignored" do
    test "explicit params arg wins over opts[:params]",
         %{service: service, client: client} do
      test_pid = self()

      Twilio.Test.stub(fn _method, _url, _headers, body ->
        send(test_pid, {:body, body})
        {200, [{"content-type", "application/json"}], "{}"}
      end)

      assert {:ok, _} =
               service.create(client, %{"Name" => "from-arg"}, params: %{"Name" => "from-opts"})

      assert_receive {:body, body}
      assert body =~ "Name=from-arg"
      refute body =~ "from-opts"
    end
  end
end
