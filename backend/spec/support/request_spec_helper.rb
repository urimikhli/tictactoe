module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def json_data
    json.map{|x| x.deep_symbolize_keys }
  end
end