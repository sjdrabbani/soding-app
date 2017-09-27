require 'rails_helper'

RSpec.feature 'User create a task' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)
  end

  scenario 'with valid input' do
    visit '/'

    click_link 'Task List'
    click_link 'New Task'
    
    fill_in 'Name', with: 'First Task'
    fill_in 'Description', with: 'This is a test description of first task'
    click_button 'Create Task'

    expect(page).to have_content('Task was successfully created')

    @task = Task.last
    expect(current_path).to eq(task_path(@task))
    expect(@john.id).to eq(@task.user_id)
  end
end
