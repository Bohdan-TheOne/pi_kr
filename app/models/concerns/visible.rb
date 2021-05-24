module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def public?
    status == 'public'
  end
  def archived?
    status == 'archived'
  end
  def private?
    status == 'private'
  end
end