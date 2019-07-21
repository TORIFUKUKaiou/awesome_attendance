module UsersHelper
  def qrcode_tag(content, options = {})
    RQRCode::QRCode.new(content).as_svg(options).html_safe
  end
end
