class MessagesController < ApplicationController
  
  def index
    @messages = Message.all
  end
  
  def show
    set_message
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = "Messageが正常に投稿されました"
      redirect_to @message
    else
      flash.now[:danger] = "Messageが投稿されませんでした"
      render :new
    end
  end
  
  def edit
    set_message
  end
  
  def update
    set_message
    if @message.update(message_params)
      flash[:success] = "Messageは正常に更新されました"
      redirect_to @message
    else
      flash.now[:danger] = "Messageは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    set_message
    @message.destroy
    
    flash[:success] = "Messageは正常に削除されました"
    redirect_to messages_url
  end
  
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
  #Stong Parameter
  def message_params
    params.require(:message).permit(:content)
  end
  
end

 