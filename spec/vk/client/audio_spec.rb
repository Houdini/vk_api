require 'helper'

describe "Client.Audio" do
  before do
    @client = Vk.new '123'
  end

  it "should return hashie" do
    stub_request(:get, "https://api.vkontakte.ru/method/audio.get?access_token=123").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'vk gem 0.0.1'}).to_return(:status => 200, :body => '{"response":[{"aid":"60830458","owner_id":"6492","artist":"Noname","title":"Bosco", "duration":"195","url":"http://cs40.vkontakte.ru/u06492/audio/2ce49d2b88.mp3"}, {"aid":"59317035","owner_id":"6492","artist":"Mestre Barrao","title":"Sinhazinha", "duration":"234","url":"http://cs510.vkontakte.ru/u2082836/audio/"}]}', :headers => {})
    result = @client.audio_get
    result.ok?.should eql(true)
  end
end
