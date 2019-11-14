class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    @omniauth = request.env['omniauth.auth'] #omniauthから情報を取ってきて、インスタンスに代入
    info = User.find_oauth(@omniauth) #上で代入した情報をinfoに代入
    @user = info[:user] #infoの中のuser情報を@userに代入
    session[:nickname] = @user.nickname #@userの中のnicknameをsessionのnicknameにあらかじめ代入
    session[:email] = @user.email #@userの中のemailをsessionのemailにあらかじめ代入
    if @user.persisted?  #@userがsave済みであるかどうか
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format? #save済みであったらログインしてrootに
    else 
      #@snsからsessionの:providerとか:uidに入れて、step1に
      @sns = info[:sns]
      session[:provider] = @sns[:provider]
      session[:uid] = @sns[:uid]
      redirect_to step1_signup_index_path
    end
  end


  def failure
    redirect_to root_path and return
  end


end
