class AppScreens
  def initialize
    @fld_nuconta = "//*[contains(@text,'NuConta')]"
    @btn_show_blc = "show-balance"
    @fld_usr_balance = "user-balance"
    @f_element = "//*[contains(@text,'Transferir')]"
    @s_element = "//*[contains(@text,'Cobrar')]"
    @class_element = "android.widget.EditText"
    @fld_search = "Buscar Contato"
  end

  def open_app
    find_element(:xpath, @fld_nuconta).displayed?
  end

  def select_show_balance
    find_element(:accessibility_id, @btn_show_blc).click
  end

  def user_balance
    find_element(:accessibility_id, @fld_usr_balance).text
  end

  def select_transfer
    firts_element = find_element(:xpath, @f_element)
    second_element = find_element(:xpath, @s_element)

    swiping(firts_element, second_element)
    find_element(:xpath, @f_element).click
  end

  def fill_contact
    find_element(class: @class_element, text: @fld_search).click
    find_element(class: @class_element, text: @fld_search).send_keys("Hank Pym")
  end

  def contact_view
    find_element(class: @class_element, text: "Hank Pym").displayed?
  end
end
