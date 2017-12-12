class Server < Sinatra::Base
  set :environment, App.env
  set :protection, false
  set :logging, true
  set :dump_errors, true
  set :raise_errors, false
  set :show_exceptions, false
  use Rack::CommonLogger, App.logger

  before do
    halt(400, 'X-Hub-Signature require') unless request.env.key?('HTTP_X_HUB_SIGNATURE')
    sha1 = request.env['HTTP_X_HUB_SIGNATURE'].split('sha1=').last

    request.body.rewind
    body = request.body.read
    sha1_calc = OpenSSL::HMAC.hexdigest('sha1', ENV['GITHUB_HOOK_SECRET'], body)

    halt(403, 'Wrong X-Hub-Signature') unless sha1 === sha1_calc
  end

  before do
    request.body.rewind
    @payload = JSON.parse request.body.read
  end

  before do
    unless request.env['HTTP_X_GITHUB_EVENT'] == 'pull_request'
      halt(200, 'Not interested')
    end
  end

  post '/github-webhook' do
    case @payload['action']
      when *%w(opened synchronize closed reopened)
        pr_number = @payload['pull_request']['number']
        pr_branch = @payload['pull_request']['head']['ref']
        commit = @payload['pull_request']['head']['sha']
        repository = @payload['repository']['full_name']
      else
        # do nothing
    end
  end
end
