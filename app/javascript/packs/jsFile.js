function myFunction()
{
  console.log("whtat the fuck");
  slideOut = document.getElementById('shoppingCart');
  if (slideOut.classList.contains("slide_user_out"))
  {
    document.getElementById('shoppingCart').className.replace("slide_user_up")
  }
  if (slideOut.classList.contains("slide_user_up"))
  {
    document.getElementById('shoppingCart').className.replace("slide_user_out")
  }
}