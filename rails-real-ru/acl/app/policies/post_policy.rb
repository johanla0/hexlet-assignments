# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? &&
      (owner? || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.admin?
  end

  private

  def owner?
    record.user == user
  end
  # END
end
