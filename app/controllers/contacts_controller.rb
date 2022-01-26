class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  def back
    @contact = Contact.new(contact_params)
    render :new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      # ContactMailer.send_mail(@contact).deliver_now
      redirect_to complete_contacts_path
    else
      render :new
    end
  end
  
  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :subject, :message)
  end

end