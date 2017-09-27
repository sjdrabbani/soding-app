require 'rails_helper'

RSpec.feature 'User create a task' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)
  end

  scenario 'with valid input' do
    visit '/'

    click_link 'Task list'
    click_link 'New task'
    
    fill_in 'Name', with: 'First Task'
    fill_in 'Description', with: 'This is a test description of first task'
    click_button 'Create task'

    expect(page).to have_content('Task has been created')

    @task = Task.last
    expect(current_path).to eq(task_path(@task))
  end
end
