json.array!(@devices) do |device|
  json.extract! device, :id, :name, :customer
  json.url device_url(device, format: :json)
end
