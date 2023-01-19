
require 'test/unit'
require_relative '../src/script'

class ScriptTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_main_present
    obj = GithubApi.new
    actual = obj.branch_exist?(obj.get('branches').body, 'main')
    assert(actual, 'Branch main is not present')
  end

  def test_main_protected
    obj = GithubApi.new
    actual = obj.branch_protected?(obj.get('branches').body, 'main')
    assert(actual, 'Branch main is not protected')
  end

  def test_develop_present
    obj = GithubApi.new
    actual = obj.branch_exist?(obj.get('branches').body, 'develop')
    assert(actual, 'Branch develop is not present')
  end

  def test_develop_protected
    obj = GithubApi.new
    actual = obj.branch_protected?(obj.get('branches').body, 'develop')
    assert(actual, 'Branch develop is not protected')
  end

  def test_develop_default
    obj = GithubApi.new
    actual = obj.default_branch(obj.get('').body)
    expected = 'develop'
    assert_equal(expected, actual, 'Default branch isn\'t  develop')
  end

end
