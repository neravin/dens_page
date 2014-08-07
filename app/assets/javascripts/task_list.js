window.onload = init;

function init() {
  var button = document.getElementById("add_button");
  button.onclick = createSticky;

  var stickiesArray = getStickiesArray();

  for( var i = 0; i < stickiesArray.length; i++ ){
    var key   = stickiesArray[i];
    var value = JSON.parse(localStorage[key]);

    addStickyToDOM(key, value);
  }
}

function createSticky() {
  var stickiesArray  = getStickiesArray();
  var currentData    = new Date();
  var colorSelectObj = document.getElementById("note_color");
  var index          = colorSelectObj.selectedIndex;
  var color          = colorSelectObj[index].value;
  var key            = "sticky_" + currentData.getTime();
  var value          = document.getElementById("note_text").value;
  var stickyObj      = {
    "value": value,
    "color": color
  };

  localStorage.setItem(key, JSON.stringify(stickyObj));
  stickiesArray.push(key);
  localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray));
  addStickyToDOM(key, stickyObj);
}


function addStickyToDOM(key, stickyObj) {
  var stickies = document.getElementById("stickies");
  var sticky   = document.createElement("li");
  var span     = document.createElement("span");
  var delete_sticky = document.createElement("span");

  sticky.setAttribute("id", key);
  sticky.style.backgroundColor = stickyObj.color;
  span.setAttribute("class", "sticky");
  span.innerHTML = stickyObj.value;
  delete_sticky.setAttribute("id", "delete-sticky");
  delete_sticky.setAttribute("class", "fa fa-times")

  sticky.appendChild(span);
  sticky.appendChild(delete_sticky);
  stickies.appendChild(sticky);
  delete_sticky.onclick = deleteSticky;
}

function getStickiesArray(){
  var stickiesArray = localStorage.getItem("stickiesArray");

  if( !stickiesArray ){
    stickiesArray = [];
    localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray));
  }
  else{
    stickiesArray = JSON.parse(stickiesArray);
  }

  return stickiesArray;
}

function deleteSticky(e){
  var stickiesArray = getStickiesArray();
  //var key           = e.target.id;

  /*if( e.target.tagName.toLowerCase() == "span" ){
    key = e.target.parentNode.id;
  }*/

  key = e.target.parentNode.id;

  localStorage.removeItem(key);
  if( stickiesArray ) {
    for( var i = 0; i < stickiesArray.length; i++ ){
      if( key == stickiesArray[i] ){
        stickiesArray.splice(i, 1);
      }
    }
    localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray));
    removeStickyFromDOM(key);
  }
}

function removeStickyFromDOM(key){
  var sticky = document.getElementById(key);
  sticky.parentNode.removeChild(sticky);
}