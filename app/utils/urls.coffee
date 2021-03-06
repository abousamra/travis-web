`import config from 'travis/config/environment'`

plainTextLog = (id) ->
  "#{config.apiEndpoint}/jobs/#{id}/log.txt?deansi=true"

githubPullRequest = (slug, pullRequestNumber) ->
  "#{config.sourceEndpoint}/#{slug}/pull/#{pullRequestNumber}"

githubCommit = (slug, sha) ->
  "#{config.sourceEndpoint}/#{slug}/commit/#{sha}"

githubRepo = (slug) ->
  "#{config.sourceEndpoint}/#{slug}"

githubWatchers = (slug) ->
  "#{config.sourceEndpoint}/#{slug}/watchers"

githubNetwork = (slug) ->
  "#{config.sourceEndpoint}/#{slug}/network"

githubAdmin = (slug) ->
  "#{config.sourceEndpoint}/#{slug}/settings/hooks#travis_minibucket"

statusImage = (slug, branch) ->
  if config.pro
    token = Travis.__container__.lookup('controller:currentUser').get('token')
    "#{location.protocol}//#{location.host}/#{slug}.svg?token=#{token}" + if branch then "&branch=#{branch}" else ''
  else
    "#{location.protocol}//#{location.host}/#{slug}.svg" + if branch then "?branch=#{encodeURIComponent(branch)}" else ''

ccXml = (slug) ->
  if config.pro
    token = Travis.__container__.lookup('controller:currentUser').get('token')
    "##{config.apiEndpoint}/repos/#{slug}/cc.xml?token=#{token}"
  else
    "#{config.apiEndpoint}/repos/#{slug}/cc.xml"

email = (email) ->
  "mailto:#{email}"

gravatarImage = (email, size) ->
  "https://www.gravatar.com/avatar/#{md5(email)}?s=#{size}&d=#{encodeURIComponent(config.avatar_default_url)}"

`export { plainTextLog, githubPullRequest, githubCommit, githubRepo, githubWatchers, githubNetwork, githubAdmin, statusImage, ccXml, email, gravatarImage }`
