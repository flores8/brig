require 'test_helper'

class PrivateMemoriesControllerTest < ActionController::TestCase
  setup do
    @private_memory = private_memories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:private_memories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create private_memory" do
    assert_difference('PrivateMemory.count') do
      post :create, private_memory: { body: @private_memory.body, name: @private_memory.name }
    end

    assert_redirected_to private_memory_path(assigns(:private_memory))
  end

  test "should show private_memory" do
    get :show, id: @private_memory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @private_memory
    assert_response :success
  end

  test "should update private_memory" do
    patch :update, id: @private_memory, private_memory: { body: @private_memory.body, name: @private_memory.name }
    assert_redirected_to private_memory_path(assigns(:private_memory))
  end

  test "should destroy private_memory" do
    assert_difference('PrivateMemory.count', -1) do
      delete :destroy, id: @private_memory
    end

    assert_redirected_to private_memories_path
  end
end
