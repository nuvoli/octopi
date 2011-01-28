require File.join(File.dirname(__FILE__), 'test_helper')

class OrganizationTest < Test::Unit::TestCase
  include Octopi
  
  def setup
    fake_everything
    @organization = Organization.find("github")
  end
  
  context Organization do
    
    should "do it" do 
      
    end
    
  end

end