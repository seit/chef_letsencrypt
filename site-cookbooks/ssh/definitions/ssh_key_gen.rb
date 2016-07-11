define :sshkeygen, :username=>nil,:passphrase=>nil do
  
  execute "sshkeygen" do
    Chef::Log.logger.info "usernam = #{params[:username]}"
    #ssh-keygen -d -b 1024 -C <ユーザー名>
    command "ssh-keygen -d -b 1024 -C #{params[:username]} -N #{params[:passphrase]} -f '/root/.ssh/id_dsa'"
  end
end
