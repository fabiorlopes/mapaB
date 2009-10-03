require 'builder'
class LoginController < ApplicationController
  def index
     render :text => "esta eh a action index <br> use a action <b>login</b>"
  end
  def login
     if request.post?
      $objLogin = Login.new()
      dados = params[:login]
      $objLogin.username= dados[:username]
      $objLogin.password= dados[:password]
      #render :text => $objLogin.retornadados
      redirect_to :action => 'gen_xml'
    end  
  end
  def gen_xml
    @xml = Builder::XmlMarkup.new
    render :layout => false
  end
end
class Login
  attr_accessor :username, :password
  def retornadados
     "#{username} e #{password}"
   end
end