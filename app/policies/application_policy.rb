class ApplicationPolicy
  attr_reader :admin, :record


  def initialize(admin, record)
    @admin = admin
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    admin.present?
  end

  def edit?
    update?
  end

  def destroy?
    admin.present? && admin.role == "superadmin"
  end

  def scope
    record.class
  end
end

