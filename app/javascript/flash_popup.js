// app/javascript/flash_popup.js

function closeFlashPopup() {
    var flashPopup = document.getElementById("flash-popup");
    flashPopup.style.display = "none";
  }
  
  // Add this line
  window.closeFlashPopup = closeFlashPopup;
  