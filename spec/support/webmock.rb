def stub_box_items_request
  stub_request(:get, "https://api.box.com/2.0/folders/0/items?limit=1000&offset=0").
    to_return(status: 200, body: "{\"total_count\":1,\"entries\":[{\"type\":\"file\",\"id\":\"1\",\"file_version\":{\"type\":\"file_version\",\"id\":\"1\",\"sha1\":\"1\"},\"sequence_id\":\"0\",\"etag\":\"0\",\"sha1\":\"1\",\"name\":\"test.txt\"}],\"offset\":0,\"limit\":100,\"order\":[{\"by\":\"type\",\"direction\":\"ASC\"},{\"by\":\"name\",\"direction\":\"ASC\"}]}", headers: {})
end
