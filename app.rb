module WebsiteToImage
  class App < Sinatra::Base

    get '/' do
      erb :index
    end

    get '/convert' do
      puts "Converting #{}"
      content_type 'image/jpeg'
      snapshot(params[:site_url])
    end

    private
    def snapshot(site_url)
      tmp_file_path = "/tmp/snap-#{Digest::MD5.hexdigest(Time.now.to_s + rand.to_s)}.jpg"
      cmd = "#{settings.root}/bin/wkhtmltoimage-amd64 --load-error-handling ignore #{site_url} #{tmp_file_path}"
      puts "executing: #{cmd}"
      system(cmd)
      File.read(tmp_file_path)
    end

  end
end
