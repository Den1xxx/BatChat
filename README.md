# Чат для помощи в локальной сети на BAT

Со статьи «Многопользовательский чат на BAT» — https://habr.com/ru/post/121903/ 

В оригинальной статье чат позволяет задать канал, имя пользователя и общаться внутри канала.
В моем случае потребовалось оказать помощь глухим на заводе, где я работаю — http://vipra.by
Глухой человек не может позвонить по телефону и объяснить, что у него не так, а идти ко мне может быть далековато.
Поэтому скриптик переписан под эти нужды: на рабочем столе у глухих ссылка на чатик, у меня он постоянно запущен.
Как только у кого то случилось непредвиденное, он может отправить сообщение со своего или соседнего компьютера.

Для использования в своих целях пришлось внести некоторые изменения в код оригинального чатика:
1. Имя пользователя присваивается автоматически как имя компьютера, а имя канала как текущая дата.
2. Диалоги переписаны на русском, прописана правильная кодировка файла.
3. При получении сообщения чат издает звук.

Оригинальный код чата с Хабра лежит в файлике "original_chat.bat", с моим модифицирванным кодом — "help.bat"

Известные проблемы:
1. При запуске несколько раз создается новое "сетевое расположение". 
Вызвано командой pushd в 4й строке файла. Чем заменить, пока не знаю.
По идее, надо где-то применять команду popd для отмены созданного диска.
После перезагрузки сетевые расположения пропадают.
