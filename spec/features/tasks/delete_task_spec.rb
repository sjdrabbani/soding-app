require 'rails_helper'

RSpec.feature 'User delete a task' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)

    @task_one = @john.tasks.create(name: 'Task one', description: 'Test des')
  end

  scenario do
    visit '/'
    click_link 'Task List'
    click_link 'Destroy'
    
    expect(page).to have_content('Task was successfully destroyed')
    expect(page).not_to have_content @task_one.name
  end
end
