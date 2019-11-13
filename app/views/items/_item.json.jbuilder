json.extract! item, :id, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :created_at, :updated_at
json.url item_url(item, format: :json)
