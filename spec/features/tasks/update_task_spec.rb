require 'rails_helper'

RSpec.feature 'User update a task' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)

    @task_one = @john.tasks.create(name: 'First Task',
                            description: 'Test description'
                          )
  end

  scenario 'with valid input' do
    visit '/'

    click_link 'Task List'
    click_link 'Edit'

    fill_in 'Name', with: 'Modified name'
    fill_in 'Description', with: 'Modified description'
    click_button 'Update Task'

    expect(page).to have_content('Task was successfully updated')

    @task_one = Task.last
    expect(@task_one.name).to eq('Modified name')
    expect(@task_one.description).to eq('Modified description')
  end  
end
