class IssuesController < ApplicationController
  def new
    @issue = Issue.new
  end

  def create
    Dotenv.load
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    repo_name = ENV['REPO_NAME']
    @issue = Issue.new(get_params)
    if @issue[:title] == '' || @issue[:content] == ''
      redirect_to new_issue_path, alert: 'issueの作成に失敗しました'
    else
      client.create_issue(repo_name,'[BOT] ' << @issue[:title], @issue[:content])
      redirect_to new_issue_path, notice: 'issueを作成しました'
    end
  end

  def get_params
    params[:issue].permit(:title, :content)
  end
end
