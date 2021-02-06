class PagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard
    true
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
