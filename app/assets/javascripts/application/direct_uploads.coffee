addEventListener 'direct-upload:initialize', (event) ->
  console.log 'event1'
  target = event
  detail = event
  id = detail
  file = detail
  target.insertAdjacentHTML 'beforebegin', '<div id="direct-upload-${id}" class="direct-upload direct-upload-pending"><div id="direct-upload-progress-${id}" class="direct-upload-progress" style="width: 0%"></div><span class="direct-upload-filename">${file.name}</span></div>'
  return

addEventListener 'direct-upload:start', (event) ->
  console.log 'event2'
  id = event.detail
  element = document.getElementById('direct-upload-${id}')
  element.classList.remove 'direct-upload--pending'
  return

addEventListener 'direct-upload:progress', (event) ->
  console.log 'event3'
  id = event.detail
  progress = event.detail
  progressElement = document.getElementById('direct-upload-progress-${id}')
  progressElement.style.width = '${progress}%'
  return

addEventListener 'direct-upload:error', (event) ->
  console.log 'event4'
  event.preventDefault()
  id = event.detail
  error = event.detail
  element = document.getElementById('direct-upload-${id}')
  element.classList.add 'direct-upload--error'
  element.setAttribute 'title', error
  return

addEventListener 'direct-upload:end', (event) ->
  console.log 'event5'
  id = event.detail
  element = document.getElementById('direct-upload-${id}')
  element.classList.add 'direct-upload--complete'
  return
