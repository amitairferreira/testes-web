class HomePage < SitePrism::Page

  element :userName, :xpath, "//div[@class='t-16 t-black t-bold']"
  element :navBarHome, :xpath, "//*[@id='global-nav']/div/nav/ul/li[1]/a/span"  
 
  def checkLoginSuccessful
      expect(userName.text).to eql "Amitair Lima"
      expect(navBarHome.text).to eql "Início"
  end

end