class PrivateMemoryPolicy < ApplicationPolicy

	def index?
		admin.present?
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

	def destroy
		admin.present && admin.role == "superadmin"
	end

end