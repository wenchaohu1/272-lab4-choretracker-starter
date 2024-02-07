require "test_helper" 
class TaskTest < ActiveSupport::TestCase

  # Test realtionshpis
  should have_many(:chores)
  should have_many(:children).through(:chores)

  # Validations
  should validate_presence_of(:name) 

  test "should order tasks alphabetically by name" do
    task1 = Task.create(name: "Task B", points: 5, active: true)
    task2 = Task.create(name: "Task A", points: 10, active: true)
    task3 = Task.create(name: "Task C", points: 8, active: true)
    
    assert_equal [task2, task1, task3], Task.alphabetical
  end

  test "should select only active tasks" do
    active_task = Task.create(name: "Active Task", points: 5, active: true)
    inactive_task = Task.create(name: "Inactive Task", points: 10, active: false)

    assert_includes Task.active, active_task
    refute_includes Task.active, inactive_task
  end
end