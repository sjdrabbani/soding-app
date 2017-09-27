require 'rails_helper'

RSpec.feature 'User can view list of his tasks' do
  before do
    @john = User.create(email: 'john@example.com', password: 'password')
    login_as(@john)

    @task_one = @john.tasks.create(name: 'Task 1', description: 'Task 1 description')
    @task_one = @john.tasks.create(name: 'Task 2', description: 'Task 2 description')
    @task_three = @john.tasks.create(name: 'Task 3', description: 'Task 3 description')
  end

  scenario 'task is available' do
    visit '/'

    click_link 'Task List'

    expect(page).to have_content(@task_one.name)
    expect(page).to have_content(@task_one.description)

    expect(page).to have_content(@task_two.name)
    expect(page).to have_content(@task_two.description)

    expect(page).to have_content(@task_three.name)
    expect(page).to have_content(@task_three.description)
  end

  scenario 'no task is available' do
    @john.tasks.delete_all

    visit '/'
    click_link 'Task List'

    expect(page).to have_content('No task available')
  end
end
