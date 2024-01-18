require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test 'Submission title is not blank' do
    submission = Submission.new
    assert_not submission.save, 'Submission saved without a title'
  end
end
