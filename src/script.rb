require 'net/http'
require 'uri'
require 'json'
  class GithubApi

    @@repo_uri =  'https://api.github.com/repos/nromanen/pratical_testing_2022'
    @@token = ''
    def get(url)
      uri = URI.parse("#{@@repo_uri}#{"/#{url}" if url != ''}")
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/vnd.github+json"
      request["Authorization"] = "Bearer #{@@token}"
      request["X-Github-Api-Version"] = "2022-11-28"

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    end

    def branch_protected?(json_obj, branch_name)
      branches = JSON.parse(json_obj).select{|element| element["name"] == branch_name}
      return "Branch with #{branch_name} doesn't exist" if branches.empty?
      branches[0]["protected"]
    end

    def branch_exist?(json_obj, branch_name)
      !JSON.parse(json_obj).select{|element| element["name"] == branch_name}.empty?
    end

    def branches(json_obj)
      JSON.parse(json_obj)
    end

    def branch(json_obj, branch_name)
      JSON.parse(json_obj).select{|element| element["name"] == branch_name}
    end

    def default_branch(json_obj)
      JSON.parse(json_obj)["default_branch"]
    end

  end


  obj = GithubApi.new
json_obj = obj.get('branches')
p json_obj
# p obj.default_branch(json_obj)

  # puts obj.branch_protected?(response_body, 'main')
  # puts obj.branch_exist?(response_body, 'main')
  # puts obj.branches(response_body)

  # puts !obj.get('https://api.github.com/repos/nromanen/pratical_testing_2022/contents/.github/ISSUE_TEMPLATE/test-case-template.md', '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').body.nil?
  #puts obj.get('https://api.github.com/repos/nromanen/pratical_testing_2022/contents/state_transition.pdf?ref=DashaFomenko', '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').body

  # puts obj.get('https://api.github.com/repos/nromanen/pratical_testing_2022/contents/CODEOWNERS?ref=main', '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').body

  # puts JSON.parse(obj.get('https://api.github.com/repos/nromanen/pratical_testing_2022', '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').body)["default_branch"]

  # puts obj.branch(response_body, 'develop')
  # hash = JSON.parse(response_body)
  # puts hash

  #puts obj.get('https://api.github.com/repos/nromanen/pratical_testing_2022/branches/develop/protection', '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').body
  # "required_pull_request_reviews":{
  #   "url":"https://api.github.com/repos/nromanen/pratical_testing_2022/branches/develop/protection/required_pull_request_reviews",
  #   "dismiss_stale_reviews":false,
  #   "require_code_owner_reviews":false,
  #   "require_last_push_approval":false,
  #   "required_approving_review_count":2
  # },
  # response.code
  # response.body


