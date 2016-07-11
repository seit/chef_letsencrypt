define :certbot_auto, :email => "uent192837465@gmail.com", :domain => "sample.com" do

  git "/root/certbot" do
    repository "git://github.com/certbot/certbot.git"
    revision "master"
    action :checkout
    user "root"
    group "root"
    notifies :run, "execute[install certbot]", :immediately
  end

  execute "install certbot" do
    action :run
    user "root"
    group "root"
    cwd "/root/certbot" # カレントワーキングディレクトリ移動
    environment "HOME" => '/root/certbot'
    
    # 証明書の取得とインストール
    #command "./certbot-auto run -m uent192837465@gmail.com -d uentseit2.com --agree-tos --test-cert --keep --no-redirect --noninteractive --quiet"
    
    # 証明書取得のみ
    #command "./certbot-auto certonly --webroot -w /var/www/html -d uentseit2.com --non-interactive --test-cert --keep --agree-tos --email uent192837465@gmail.com"
    command "./certbot-auto certonly --webroot -w /var/www/html -d #{params[:domain]} --non-interactive --test-cert --keep --agree-tos --email #{params[:email]}"
    
    #code <<-EOH
    #./certbot-auto run -m uent192837465@gmail.com -d uentseit2.com --agree-tos --test-cert --keep --no-redirect
    #EOH
  end
end
