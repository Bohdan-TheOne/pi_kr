class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end
    
    def show?
        record.public? || author? || admin?
    end
        
    def create?
        !!user || admin?
    end
    
    def update?
        author? || admin?
    end
    
    def destroy?
        author? || admin?
    end

private
    def author?
        return false unless user
        record.author_id == user.id
    end
end