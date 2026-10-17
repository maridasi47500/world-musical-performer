class HelloController < ApplicationController
  def there
    @channel = Yt::Channel.new id:  params[:myid]
    @videos=@channel.videos

    #@videos=JSON.parse(File.read("hello.json"))
    @videos.each do |x|
      p x.as_json
    end
    
  end
end
