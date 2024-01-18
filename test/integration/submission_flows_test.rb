require 'test_helper'

class SubmissionFlowsTest < ActionDispatch::IntegrationTest
  test 'can see the submission index' do
    get '/'
    assert_select 'h1', 'Submission'
  end

  test 'can create a submission' do
    get '/submissions/new'
    assert_response :success

    post '/submissions', {
      params: { submission: {
        title: 'test submission title',
        body: 'Oh my testing content'
      } }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'p.submission-title', "Title:\ test submission title"
  end
end
