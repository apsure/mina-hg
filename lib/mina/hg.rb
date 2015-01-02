# encoding: utf-8

# # Modules: Mercurial
# Adds settings and tasks related to managing Mercurial.
#
#     require 'mina/hg'

# ## Settings
# Any and all of these settings can be overriden in your `deploy.rb`.

# ### branch
# Sets the branch to be deployed.

set_default :branch, 'default'

namespace :hg do
  # ## Deploy tasks
  # These tasks are meant to be invoked inside deploy scripts, not invoked on
  # their own.

  # ### hg:clone
  # Clones the Mercurial repository. Meant to be used inside a deploy script.

  desc "Clones the Mercurial repository to the release path."
  task :clone do
    clone = if commit?
      %[
        echo "-----> Using hg commit '#{commit}'" &&
        #{echo_cmd %[hg clone "#{repository!}" .]} &&
        #{echo_cmd %[hg checkout current_release "#{commit}"]} &&
      ]
    else
      %{
        if [ ! -d "#{deploy_to}/scm/.hg" ]; then
          echo "-----> Cloning the Mercurial repository"
          #{echo_cmd %[hg clone "#{repository!}" "#{deploy_to}/scm"]}
        else
          echo "-----> Fetching new hg commits"
          #{echo_cmd %[(cd "#{deploy_to}/scm" && hg pull -b "#{branch}" #{repository!})]}
        fi &&
        echo "-----> Using hg branch '#{branch}'" &&
        #{echo_cmd %[hg clone "#{deploy_to}/scm" . --branch "#{branch}"]} &&
      }
    end

    status = %[
      echo "-----> Using this hg commit" &&
      echo &&
      #{echo_cmd %[hg log --limit 1]} &&
      echo
    ]

    queue clone + status
  end
end
