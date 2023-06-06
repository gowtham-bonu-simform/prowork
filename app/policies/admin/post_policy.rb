class Admin::PostPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    user.has_role? :client
  end

  def create?
    user.has_role? :client
  end
end