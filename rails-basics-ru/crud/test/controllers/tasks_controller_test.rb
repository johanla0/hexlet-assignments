require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'should create task' do
    params = {
      name: 'New task',
      status: 'Status',
      creator: 'Creator',
      performer: 'Performer',
      completed: true
    }

    assert_difference('Task.count') do
      post tasks_path, params: { task: params }
    end

    assert_redirected_to task_path(Task.last)
  end

  test 'should show task' do
    get task_path(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_path(@task)
    assert_response :success
  end

  test 'should update task' do
    params = {
      name: 'New task',
      status: 'Status',
      creator: 'Creator',
      performer: 'Performer',
      completed: true
    }

    patch task_path(@task), params: { task: params }
    assert_redirected_to root_path
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_path(@task)
    end

    assert_redirected_to root_path
  end
end
