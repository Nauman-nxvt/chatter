namespace :chatter do
  desc "Logout idle users"
  task logout_idle_users: :environment do
    # (Time.now - ActiveRecord::SessionStore::Session.first.updated_at)/60 > 20
    ActiveRecord::SessionStore::Session.where('updated_at < ?', 1.minutes.ago).each do |s|
      if User.find_by(id: s.user_id)
        User.find(s.user_id).delete
      end
      s.delete
      Rails.logger.info("Rake task run at #{Time.now}")
      p "Rake task run at #{Time.now}"
    end

  end

end
