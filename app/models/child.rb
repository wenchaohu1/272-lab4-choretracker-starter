class Child < ApplicationRecord

    has_many :chores
    has_many :tasks, :through => :chores

    # Validations
    validates_presence_of :first_name
    validates_presence_of :last_name

    # Scope
    scope :active, -> { where(active: true) } 
    scope :alphabetical, -> { order(first_name: :asc) }

    # name methods that list first_ and last_names combined
    def name
        # Got from https://stackoverflow.com/questions/40799343/combine-first-and-last-name-into-single-field-in-rubyonrails
        [first_name, last_name].join(' ')
    end

end
