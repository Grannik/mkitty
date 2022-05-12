#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=41; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 39 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 42 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  3 3; $e " Скрыть курсор мыши после количества секунд \e[32mmouse_hide_wait                  \e[0m";}
  M1(){ TPUT  4 3; $e " Цвет выделения URL-адресов                 \e[32murl_color                        \e[0m";}
  M2(){ TPUT  5 3; $e " Cтиль выделения URL-адресов                \e[32murl_style                        \e[0m";}
  M3(){ TPUT  6 3; $e " Программа, которой открываются URL-адреса  \e[32mopen_url_with                    \e[0m";}
  M4(){ TPUT  7 3; $e " Обнаружение URL-адресов под мышью          \e[32mdetect_urls                      \e[0m";}
  M5(){ TPUT  8 3; $e " Дополнительные символы, которые запрещены  \e[32murl_excluded_characters          \e[0m";}
  M6(){ TPUT  9 3; $e " Копировать в буфер обмена / частный буфер  \e[32mcopy_on_select no                \e[0m";}
  M7(){ TPUT 10 3; $e " Список действий, при вставке текста        \e[32mpaste_actions                    \e[0m";}
  M8(){ TPUT 11 3; $e " Удалять пробелы в конце / при копировании  \e[32mstrip_trailing_spaces never      \e[0m";}
  M9(){ TPUT 12 3; $e " Символы, часть слова при двойном щелчке    \e[32mselect_by_word_characters        \e[0m";}
 M10(){ TPUT 13 3; $e " Интервал между последовательными кликами   \e[32mclick_interval                   \e[0m";}
 M11(){ TPUT 14 3; $e " Установите активное окно в окно под мышью  \e[32mfocus_follows_mouse no           \e[0m";}
 M12(){ TPUT 15 3; $e " Форма указателя мыши                       \e[32mpointer_shape_when_grabbed       \e[0m";}
 M13(){ TPUT 16 3; $e " Форма указателя мыши по умолчанию          \e[32mdefault_pointer_shape            \e[0m";}
 M14(){ TPUT 17 3; $e " Форма указателя мыши по умолчанию          \e[32mpointer_shape_when_dragging beam \e[0m";}
 M15(){ TPUT 18 3; $e " Действия мыши                              \e[32mMouse actions                    \e[0m";}
 M16(){ TPUT 19 3; $e " Вы можете удалить все действия мыши        \e[32mclear_all_mouse_actions          \e[0m";}
 M17(){ TPUT 20 3; $e " Сначала проверьте выбор, ничего не делайте \e[32mmouse_map left click             \e[0m";}
 M18(){ TPUT 21 3; $e " щелчок захвачен, разблокирован             \e[32mmouse_map shift+left             \e[0m";}
 M19(){ TPUT 22 3; $e " версия, основанная на простом клике        \e[32mmouse_map ctrl+shift+left        \e[0m";}
 M20(){ TPUT 23 3; $e " Предотвратите отправку этого события       \e[32mmouse_map ctrl+shift+left        \e[0m";}
 M21(){ TPUT 24 3; $e " Начать выделение текста                    \e[32mmouse_map middle                 \e[0m";}
 M22(){ TPUT 25 3; $e " Начните выделять текст в прямоугольнике    \e[32mmouse_map left                   \e[0m";}
 M23(){ TPUT 26 3; $e " Выберите слово                             \e[32mmouse_map ctrl+alt+left          \e[0m";}
 M24(){ TPUT 27 3; $e " Выберите линию                             \e[32mmouse_map left doublepress       \e[0m";}
 M25(){ TPUT 28 3; $e " Выбрать всю линию Выделить линию из точки  \e[32mmouse_map left triplepress       \e[0m";}
 M26(){ TPUT 29 3; $e " Выбрать от точки, в которой щелкнули       \e[32mmouse_map ctrl+alt+left          \e[0m";}
 M27(){ TPUT 30 3; $e " чтобы перемещался только конец выделения   \e[32mmouse_map right press ungrabbed  \e[0m";}
 M28(){ TPUT 31 3; $e " Начинайте выделять текст когда он захвачен \e[32mmouse_map shift+middle           \e[0m";}
 M29(){ TPUT 32 3; $e " Начните выделять текст в прямоугольнике    \e[32mmouse_map shift+left press       \e[0m";}
 M30(){ TPUT 33 3; $e " Выберите слово, даже если его схватили     \e[32mmouse_map ctrl+shift+alt+left    \e[0m";}
 M31(){ TPUT 34 3; $e " Выберите линию, даже когда она захвачена   \e[32mmouse_map shift+left doublepress \e[0m";}
 M32(){ TPUT 35 3; $e " Выбрать линию из точки даже при захвате    \e[32mmouse_map shift+left triplepress \e[0m";}
 M33(){ TPUT 36 3; $e " Выберите от точки, до конца строки         \e[32mmouse_map ctrl+shift+alt+left    \e[0m";}
 M34(){ TPUT 37 3; $e " Показать нажатую команду в пейджере        \e[32mmouse_map shift+right press      \e[0m";}
 M35(){ TPUT 38 3; $e " Для работы требуется                       \e[32mmouse_map ctrl+shift+right press \e[0m";}
#
 M36(){ TPUT 40 3; $e " \e[32mExit                                                                        \033[0m";}
LM=36
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Скрыть курсор мыши после указанного количества секунд, в течение которого мышь
 не используется. Установите на ноль, чтобы отключить скрытие курсора мыши.
 Установите отрицательное значение, чтобы сразу скрыть курсор мыши при вводе
 текста. По умолчанию отключено в macOS, так как заставить его надежно работать
 с постоянно меняющимся морем ошибок,
 которым является Cocoa, требует слишком много усилий.
\e[32m mouse_hide_wait 3.0\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m url_color #0087bd\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e " Цвет и стиль выделения URL-адресов при наведении курсора мыши.
 url_style может быть одним из следующих:
\e[32m url_style\e[36m none     \e[0mнет
          \e[36m straight \e[0mпрямой
          \e[36m double   \e[0mдвойной
          \e[36m curly    \e[0mфигурный
          \e[36m dotted   \e[0mпунктирный
          \e[36m dashed   \e[0mпунктирный
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e " Программа, с помощью которой открываются URL-адреса, на которые нажимают.
 Специальное значение default означает использование обработчика URL по умолчанию
 операционной системы (open в macOS и xdg-open в Linux).
 url_prefixes
 file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh
 Набор префиксов URL для поиска при обнаружении URL под курсором мыши.
\e[32m open_url_with default\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e " Обнаруженные URL-адреса выделяются подчеркиванием,
 и курсор мыши становится над рукой.
 Даже если этот параметр отключен, URL-адреса по-прежнему доступны для кликов.
\e[32m detect_urls yes\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e " Дополнительные символы, которые должны быть запрещены в URL-адресах
 при обнаружении URL-адресов под курсором мыши.
 По умолчанию все допустимые символы в URL-адресах разрешены.
\e[32m url_excluded_characters\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e " Копировать в буфер обмена или частный буфер при выборе.
 Если этот параметр установлен в буфер обмена, простое выделение текста
 с помощью мыши приведет к тому, что текст будет скопирован в буфер обмена.
 Полезно на таких платформах, macOS, в которых нет концепции основного выбора.
 Вместо этого вы можете указать имя, такое как a1, для копирования в личный
 буфер kitty. Сопоставьте ярлык с действием paste_from_buffer для вставки из
 этого частного буфера. Например: сдвиг карты+cmd+v paste_from_buffer a1
 Обратите внимание, что копирование в буфер обмена является угрозой безопасности,
 так как все программы, в том числе веб-сайты, открытые в вашем браузере,
 могут читать содержимое системного буфера обмена.
\e[32m copy_on_select no\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e " Список действий, разделенных запятыми,
 которые необходимо выполнить при вставке текста в терминал. Возможности:
 quote-urls-at-prompt::
 Если вставляемый текст является URL-адресом, курсор находится в командной строке,
 автоматически укажите URL-адрес в кавычках
 (требуется https://sw.kovidgoyal.net/kitty/shell-integration/).
 confirm:
 Подтвердите вставку, если режим вставки в квадратных скобках не активен
 или вставляется большой объем текста.
 filter:
 Запустите функцию filter_paste() из файла paste-actions.py в каталог конфигурации
 kitty во вставленном тексте. Текст,
 возвращаемый функцией, будет фактически вставлен.
\e[32m paste_actions quote-urls-at-prompt\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Удалять пробелы в конце строк при копировании в буфер обмена.
 Значение smart будет делать это при использовании обычных выделений,
 но не прямоугольных выделений всегда всегда будет делать это.
\e[32m strip_trailing_spaces never\e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Символы считаются частью слова при двойном щелчке.
 В дополнение к этим символам любой символ,
 помеченный как  будет совпадать буквенно-цифровой символ в базе данных Unicode.
\e[32m select_by_word_characters @ - . /_~ ? & = % + # \e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Интервал между последовательными кликами для обнаружения двойного/тройного
 клика (в секундах). Отрицательные числа будут использовать систему по умолчанию
 вместо этого, если доступно, или вернуться к 0,5.
\e[32m click_interval -1.0\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Установите активное окно в окно под мышью при перемещении мыши
\e[32m focus_follows_mouse no\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Форма указателя мыши, когда программа, запущенная в терминале, захватывает мышь.
 Допустимые значения:\e[32m arrow \e[0mстрелка
                     \e[32m beam  \e[0mлуч
                     \e[32m hand  \e[0mрука
\e[32m mpointer_shape_when_grabbed arrow\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e " Форма указателя мыши по умолчанию. Допустимые значения:\e[32m arrow \e[0mстрелка
                                                        \e[32m beam  \e[0mлуч
                                                        \e[32m hand  \e[0mрука
\e[32m default_pointer_shape beam\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Форма указателя мыши по умолчанию при перетаскивании по тексту.
 Допустимые значения:\e[32m arrow \e[0mстрелка
                     \e[32m beam  \e[0mлуч
                     \e[32m hand  \e[0mрука
\e[32m pointer_shape_when_dragging beam\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Действия мыши\e[32m Mouse actions\e[0m
 Кнопки мыши можно переназначить для выполнения произвольных действий.
 синтаксис для этого:
 .. code-block:: none
 mouse_map button-name event-type режимы действие Где
 'button-name' является одним из 'left', 'middle', 'right' или 'b1 ... b8'
 с добавленными модификаторами клавиатуры, например:
 'ctrl+shift+left' относится к удержанию клавиш Ctrl+Shift во время
 щелчком левой кнопки мыши. Число 'b1 ... b8' можно использоваться для обозначения
 до восьми кнопок на мыши: 'event-type' is one 'press', 'release', 'doublepress',
 'triplepress', 'click' and 'doubleclick' 'modes' указывает, выполняется ли
 действие при захвате мыши программой, работающей в терминале, или нет. Он может
 иметь один или больше или значения 'grabbed,ungrabbed' 'grabbed' относится к
 когда программа, запущенная в терминале, запросила мышь События. Обратите
 внимание, что события щелчка и двойного щелчка имеют задержку click_interval для
 устранения неоднозначности двойных и тройных нажатий. Вы можете запустить kitty с
 параметром командной строки kitty --debug-input, чтобы увидеть события мыши.
 См. встроенные действия ниже, чтобы понять, что возможно. Если вы хотите отменить
 сопоставление действия, сопоставьте его с 'no-op'. Например, чтобы отключить
 открытие URL-адресов простым кликом: mouse_map щелкнуть левой кнопкой мыши без
 захвата .. примечание:
 После того, как выделение началось, отпускание кнопки, которая его запустила,
 автоматически завершить его, и событие выпуска не будет отправлено.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Вы можете попросить kitty удалить все действия мыши, замеченные до этого момента.
 Полезно, например, для удаления действий мыши по умолчанию.
 Нажмите на ссылку под мышкой или переместите курсор
\e[32m clear_all_mouse_actions no\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Сначала проверьте выбор и, если он существует, ничего не делайте.
 Затем проверьте наличие ссылки под курсором мыши и, если она существует, нажмите
 Это. Наконец, проверьте, произошел ли щелчок в текущей подсказке оболочки,
 и если да, переместите курсор в место щелчка.
 Примечание что для этого требуется интеграция с оболочкой.
 Щелкните ссылку под мышью или переместите курсор даже при захвате
\e[32m  mouse_map left click ungrabbed mouse_handle_click selection link prompt\e[0m
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 щелчок захвачен, разблокирован mouse_handle_click ссылка выбора ссылки
 То же, что и выше, за исключением того, что действие выполняется,
 даже когда мышь захватывается программой, работающей в терминале.
 Щелкните ссылку под курсором мыши
\e[32m mouse_map shift+left\e[0m";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Вариант с ctrl+shift присутствует, потому что версия, основанная на простом
 клике, имеет неизбежную задержку click_interval, чтобы отличить клики от
 двойных кликов. Отменить событие нажатия для клика по ссылке
\e[32m release grabbed,ungrabbed mouse_handle_click link\e[0m";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Предотвратите отправку этого события нажатия программе, захватившей мышь,
 поскольку соответствующее событие освобождения используется для открытия
 URL-адреса. Вставить из основного выделения
\e[32m mouse_map ctrl+shift+left press grabbed discard_event\e[0m";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e " Начать выделение текста
\e[32m mouse_map middle release ungrabbed paste_from_selection\e[0m";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e " Начните выделять текст в прямоугольнике
\e[32m mouse_map left press ungrabbed mouse_selection normal\e[0m";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e " Выберите слово:
\e[32m mouse_map ctrl+alt+left press ungrabbed mouse_selection rectangle\e[0m";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e " Выберите линию:
\e[32mmouse_map left doublepress ungrabbed mouse_selection word \e[0m";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo -e " Выбрать всю линию Выделить линию из точки
\e[32m mouse_map left triplepress ungrabbed mouse_selection line\e[0m";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo -e " Выбрать от точки, в которой щелкнули, до конца строки Расширить текущий выбор
\e[32m mouse_map ctrl+alt+left triplepress ungrabbed mouse_selection line_from_point\e[0m";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo -e "
 Если вы хотите, чтобы перемещался только конец выделения вместо ближайшей границы,
 используйте move-end вместо extend.
 Вставить из основного выделения даже при захвате
\e[32m mouse_map right press ungrabbed mouse_selection extend\e[0m";ES;fi;;
 28) S=M28;SC;if [[ $cur == enter ]];then R;echo -e " Начинайте выделять текст, даже когда он захвачен
\e[32m mouse_map shift+middle release ungrabbed,grabbed paste_selection\e[0m
\e[32m mouse_map shift+middle press grabbed discard_event\e[0m";ES;fi;;
 29) S=M29;SC;if [[ $cur == enter ]];then R;echo -e " Начните выделять текст в прямоугольнике, даже когда он захвачен
\e[32m mouse_map shift+left press ungrabbed, grabbed mouse_selection normal\e[0m";ES;fi;;
 30) S=M30;SC;if [[ $cur == enter ]];then R;echo -e " Выберите слово, даже если его схватили
\e[32m mouse_map ctrl+shift+alt+left press ungrabbed,grabbed mouse_selection rectangle\e[0m";ES;fi;;
 31) S=M31;SC;if [[ $cur == enter ]];then R;echo -e " Выберите линию, даже когда она захвачена
\e[32m mouse_map shift+left doublepress ungrabbed,grabbed mouse_selection word\e[0m";ES;fi;;
 32) S=M32;SC;if [[ $cur == enter ]];then R;echo -e " Выбрать линию из точки даже при захвате:
\e[32m mouse_map shift+left triplepress ungrabbed,grabbed mouse_selection line\e[0m";ES;fi;;
 33) S=M33;SC;if [[ $cur == enter ]];then R;echo -e "
 Выберите от точки, по которой щелкнули, до конца строки.
 Расширьте текущий выбор, даже если он был захвачен:
\e[32m mouse_map ctrl+shift+alt+left triplepress ungrabbed,grabbed mouse_selection line_from_point\e[0m";ES;fi;;
 34) S=M34;SC;if [[ $cur == enter ]];then R;echo -e " Показать нажатую команду в пейджере
\e[32m mouse_map shift+right press ungrabbed,grabbed mouse_selection extend\e[0m";ES;fi;;
 35) S=M35;SC;if [[ $cur == enter ]];then R;echo -e " Для работы требуется https: //sw.kovidgoyal.net/kitty/shell-integration/
 \e[32m mouse_map ctrl+shift+right press ungrabbed mouse_show_command_output\e[0m";ES;fi;;
#
 36) S=M36;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
