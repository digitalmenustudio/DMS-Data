# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000'  # Allow requests from your Next.js app during development
      resource '*',
        headers: :any,
        methods: [:get, :options, :head],
        credentials: true
    end
  
    # Allow requests from your deployed Next.js app in production
    allow do
      origins 'https://your-nextjs-app.com'  # Replace with your production Next.js app domain
      resource '*',
        headers: :any,
        methods: [:get, :options, :head],
        credentials: true
    end
  end
  