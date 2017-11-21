class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      true if current_restaurant
    end

    def new?
    end
  end
end
