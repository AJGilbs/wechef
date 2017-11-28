class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.conversation.chef == user || record.conversation.restaurant == user
  end
end
