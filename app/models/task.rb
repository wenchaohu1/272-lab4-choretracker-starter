class Task < ApplicationRecord

    has_many :chores
    has_many :children, through: :chores

    # Validations
    validates_presence_of :name

    # Scope
    scope :active, -> { where(active: true) } 
    scope :alphabetical, -> { order(name: :asc) }

end
