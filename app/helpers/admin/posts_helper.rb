module Admin::PostsHelper
  def get_time(past_date)
    days = (Date.today-past_date.to_date).to_i
    days == 0 ? 'today' : "#{days} ago"
  end
end
