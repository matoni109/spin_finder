class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    return true
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  # # Edit calls update ? in App Policy
  # def edit?
  #   # if user is own true otherwise false
  #   # user => current user
  #   #record => @restaurant ( arg passed to 'authorize' )
  #   user == record.user ? true : false
  # end

  def update?
    user_is_owner_or_admin?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
