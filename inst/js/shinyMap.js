var shinyMapBinding = new Shiny.InputBinding();
$.extend(shinyMapBinding, {

  // find the dom element with input$id
  // this becomes el downstream
  find: function find(scope) {
    return $(scope).find(".map");
  },

  // get the ids of the element with class selected
  // use this as the input's value
  getValue: function getValue(el) {
    // return everything with selected class and get its id
    var idArray = [];
        $('.selected').each(function () {
          idArray.push(this.id);
        });
        // returning everything but the id and switch
        // and some random empty strings if you don't click EXACTLY the glyph
    return idArray.filter(word => word !== $(el).attr("id"))
                  .filter(word => word !== $(el).attr("id") + "_switch")
                  .filter(word => word !== "");
  },

  // on key click add "selected" class
  // to svg path with the id of the pressed key
  subscribe: function (el, callback) {
    $(el).on("click.shinyMapBinding", function (evt) {
      // if the toggle is selected let the user push new values
      // but remove the class if they clicked on an already selected class
      if ($("#" + $(el).attr("id") + "_switch").is(':checked')) {
        if ($(evt.target).hasClass("selected")) {
          $(evt.target).removeClass("selected");
        } else {
          $(evt.target).addClass('selected');
        }
      } else {
        $(el).find(".selected").removeClass("selected");
        $(evt.target).addClass('selected');
      }

      //$(el).find(".light_on").removeClass("light_on");

      //if ($("#caps").hasClass("selected"))  $("#light1").addClass("light_on")
      //if ($("#scroll").hasClass("selected")) $("#light2").addClass("light_on")
      //if ($("#numlock").hasClass("selected")) $("#light3").addClass("light_on")

      callback();
    });
    
  },
  unsubscribe: function (el) {
    $(el).off(".shinyKeyboardBinding");
  }
});

Shiny.inputBindings.register(shinyMapBinding, 'shinyMap.mapInput');