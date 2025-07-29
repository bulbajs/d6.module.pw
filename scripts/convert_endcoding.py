import codecs

# Открытие файла с текущей кодировкой UTF-16 LE
with codecs.open('data.json', 'r', 'utf-16-le') as source_file:
    content = source_file.read()

# Сохранение файла в новой кодировке UTF-8
with codecs.open('data_utf8.json', 'w', 'utf-8') as target_file:
    target_file.write(content)