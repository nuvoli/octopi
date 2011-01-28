module Octopi
  class Organization < Base
    include Resource
    
    attr_accessor :id, :name, :company, :gravatar_id, :location, :created_at, 
                  :blog, :public_gist_count, :public_repo_count, :following_count, 
                  :followers_count, :login, :email
    
    resource_path "/organizations/:id"
    
    def repositories(public_only=false)
      repos = Api.api.get("/organizations/#{login}/#{"public_" if public_only}repositories")
      puts "Repos: #{repos.inspect}\n\n\n..."
      repos['repositories'].map do |repo|
        puts "-> Adding repo #{repo.inspect}"
        Repository.new(repo)
      end unless repos['repositories'].nil?
    end
    
    def public_repositories
      repositories(true)
    end

    def public_members
      Api.api.get("/organizations/#{login}/public_members")["users"].map do |u|
        User.new(u)
      end
    end

  end
end