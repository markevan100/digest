json.extract! response, :id, :title, :answer, :user_id, :discussion_id, :created_at, :updated_at
json.url response_url(response, format: :json)
