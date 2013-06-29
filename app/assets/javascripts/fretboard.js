var FretBoard = function(){
  this.toggleWholeNotes = function(){
    $("td[data-whole='true'] span.note").toggle()
  },

  this.toggleSharpsAndFlats = function(){
    $("td[data-whole='false'] span.note").toggle()
  },

  this.togglePentatonicScale = function(){
    $("td[data-pentatonic='true']").toggleClass('marked')
  }
};
