set :whenever_environment, environment || 'production'
env :PATH, ENV['PATH']

every 10.minutes do
  rake "chatter:logout_idle_users", environment: 'development'
end
