class Backbone.ViewManager
  
  container: '#content_panel'

  # Close the current view, render the given view into @element
  showView: (view) ->
    if (@currentView)
      @currentView.close()

    @currentView = view
    @currentView.render()

    $(@container).html(@currentView.el)

  # Returns true if element is empty
  isEmpty: () ->
    @$el.is(':empty')

_.extend(Backbone.View.prototype, 

  # Clean up all bindings and remove elements from DOM
  close: () ->
    @undelegateEvents()
    @remove()
    @off()
    @onClose() if @onClose # Some views have specific things to clean up

)

AM.VM = new Backbone.ViewManager()