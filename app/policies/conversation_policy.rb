class ConversationPolicy < ApplicationPolicy
  def show?
    record.chef == user || record.restaurant == user
  end
end
