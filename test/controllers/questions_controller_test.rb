require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      # Do something
    end
    
    assert_redirected_to question_path(assigns(:question))
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get delete" do
    assert_difference('Question.count', -1) do
      # Do something
    end
    
    assert_response questions_path
  end
end
