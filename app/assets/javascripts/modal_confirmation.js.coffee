# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.allowAction = (element) ->
      message = element.data('confirm')
      return true unless message
      $link = element.clone()
        .removeAttr('class')
        .removeAttr('data-confirm')
        .addClass('btn').addClass('btn-success')
        .html("Да")

      modal_html = """
                    <div class="modal fade" id="myModal">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3>Подтверждение</h3>
                          </div>
                          <div class="modal-body">
                            <p>#{message}</p>
                          </div>
                          <div class="modal-footer">
                            <a data-dismiss="modal" class="btn">Нет</a>
                          </div>
                        </div>
                      </div>
                    </div>
                   """
      $modal_html = $(modal_html)
      # Add the new button to the modal box
      $modal_html.find('.modal-footer').append($link)
      # Pop it up
      $modal_html.modal()
      # Prevent the original link from working
      return false