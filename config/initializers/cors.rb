Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'ufront.netlify.app'
    resource '*', headers: :any, methods: %i[get post patch put]
  end
end
