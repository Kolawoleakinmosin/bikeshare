class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    true
  end

  def mybookings?
    true
  end

  def approve?
    true
  end

  def confirmation?
    true
  end
end
