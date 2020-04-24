# frozen_string_literal: true

class SoapAdapter
  attr_accessor :universal_id

  def initialize(universal_id)
    @universal_id = universal_id
  end

  def preferences
    email_xml = fetch_email_preferences || ''
    email = Validate.email(email_xml.split(', '))

    xml_address = fetch_address_preferences || ''
    address = Validate.address(xml_address)

    xml_payment = fetch_payment_preferences || ''
    payment = Validate.payment(xml_payment)

    xml_telephone = fetch_telephone_preferences || ''
    telephone = Validate.telephone(xml_telephone.split(', '))

    map_to_hash(email, address, payment, telephone)
  end

  private

  def map_to_hash(email, address, payment, telephone)
    {
      email:     email,
      address:   address,
      payment:   payment,
      telephone: telephone
    }
  end

  def fetch_email_preferences
  end

  def fetch_address_preferences
  end

  def fetch_payment_preferences
  end

  def fetch_telephone_preferences
  end
end
