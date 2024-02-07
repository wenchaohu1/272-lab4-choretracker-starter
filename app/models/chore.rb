class Chore < ApplicationRecord 
    # Relationships
    belongs_to :child
    belongs_to :task

    # Validations
    validates_datetime :due_on 

    # Scopes 
    scope :by_task, -> { joins(:task).order('tasks.name') }
    scope :chronological, -> { order('due_on') } 

    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where('due_on >= ?', Date.today) }
    scope :past, -> { where('due_on < ?', Date.today) }

    # Method 
    def status
        completed ? "Completed" : "Pending"
    end

end
