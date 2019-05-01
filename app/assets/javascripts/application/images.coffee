window.addEventListener 'DOMContentLoaded', () ->
  description = document.querySelector('#description-image')

  toolbarOptions = [
    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
    ['bold', 'italic', 'underline'],
    ['blockquote', 'code-block'],
    [{ 'font': [] }],
    [{ 'indent': '-1'}, { 'indent': '+1' }],
    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
    [{ 'align': [] }],
    [{ 'color': [] }, { 'background': [] }]
  ]

  if description

    content = document.querySelector(description.dataset.description)
    console.log 'content', content

    quill = new Quill '#description-image',
      modules:
        toolbar: toolbarOptions
      theme: 'snow'
    console.log 'quill', quill

    quill.on 'text-change', ->
      console.log 'text change'
      content.value = quill.root.innerHTML

  $('.img-picture').on 'change', ->
    previewPicture = ->
      preview = document.querySelector('.image-pic')
      file = document.querySelector('.img-picture').files[0]
      reader = new FileReader
      reader.addEventListener 'load', () ->
        preview.src = reader.result
      if file
        reader.readAsDataURL file
    previewPicture()
