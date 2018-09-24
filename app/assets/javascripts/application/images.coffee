window.addEventListener 'DOMContentLoaded', () ->
  editor = document.querySelector('#description-image')
  if editor
    # console.log 'editor', editor.dataset.camera
    # content = document.querySelector(editor.dataset.camera)

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
    quill = new Quill '#description-image',
      modules:
        toolbar: toolbarOptions
      theme: 'snow'

    # quill.on 'text-change', ->
    #   content.value = quill.root.innerHTML
    #   $('.editor-text-value').attr('value', content.value)

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

      # $('.multi-img-picture').on 'change', ->
      #   previewPicture = ->
      #     preview = document.querySelector('.multi-image-pic')
      #     file = document.querySelector('.multi-img-picture').files[0]
      #     reader = new FileReader
      #     reader.addEventListener 'load', () ->
      #       preview.src = reader.result
      #     if file
      #       reader.readAsDataURL file
      #   previewPicture()
