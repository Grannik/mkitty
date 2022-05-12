#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=20; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[35m+- Разное ----------------------------------- -Miscellaneous --------------------+\e[0m";
 TPUT 18 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 21 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  4 3; $e " Включить полноэкранный режим               \e[32m Toggle fullscreen               \e[0m";}
  M1(){ TPUT  5 3; $e " Развернуть                                 \e[32m Toggle maximized                \e[0m";}
  M2(){ TPUT  6 3; $e " Переключить безопасный ввод с клавиатуры\e[32m Toggle macOS secure keyboard entry \e[0m";}
  M3(){ TPUT  7 3; $e " Bвод Юникода                               \e[32m Unicode input                   \e[0m";}
  M4(){ TPUT  8 3; $e " Редактировать файл конфигурации            \e[32m Edit config file                \e[0m";}
  M5(){ TPUT  9 3; $e " Откройте командную оболочку kitty          \e[32m Open the kitty command shell    \e[0m";}
  M6(){ TPUT 10 3; $e " Увеличить непрозрачность фона              \e[32m Increase background opacity     \e[0m";}
  M7(){ TPUT 11 3; $e " Сделать фон полностью непрозрачным         \e[32m Make background fully opaque    \e[0m";}
  M8(){ TPUT 12 3; $e " Сбросить непрозрачность фона               \e[32m Reset background opacity        \e[0m";}
  M9(){ TPUT 13 3; $e " Сбросить терминал                          \e[32m Reset the terminal              \e[0m";}
 M10(){ TPUT 14 3; $e " Вы можете создавать ярлыки для очистки/сброса терминала                    ";}
 M11(){ TPUT 15 3; $e " Очистить до строки курсора                 \e[32m Clear up to cursor line         \e[0m";}
 M12(){ TPUT 16 3; $e " Перезагрузить kitty.conf                   \e[32m Reload kitty.conf               \e[0m";}
 M13(){ TPUT 17 3; $e " Отладка конфигурации kitty                 \e[32m Debug kitty configuration       \e[0m";}
#
 M14(){ TPUT 19 3; $e " \e[90mExit                                                                        \e[0m";}
LM=14
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f11 toggle_fullscreen\e[0m
\e[32m map ctrl+cmd+f    toggle_fullscreen\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f10 toggle_maximized\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map opt+cmd+s toggle_macos_secure_keyboard_entry\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+u    kitten unicode_input\e[0m
\e[32m map ctrl+cmd+space kitten unicode_input\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f2 edit_config_file\e[0m
\e[32m map cmd+,        edit_config_file\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Откройте оболочку kitty в новом window/tab/overlay/os_window,
 чтобы управлять котенком с помощью команд.
\e[32m map kitty_mod+escape kitty_shell window\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+a>m set_background_opacity +0.1\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+a>1 set_background_opacity 1\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+a>d set_background_opacity default\e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+delete clear_terminal reset active\e[0m
\e[32m map opt+cmd+r        clear_terminal reset active\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Если вы хотите работать со всеми окнами, а не только с текущим,
 используйте all вместо active.
 Сбросить терминал:                        map f1 clear_terminal reset active
 Очистите экран, удалив содержимое:        map f1 clear_terminal clear active
 Очистите прокрутку терминала, удалив ее:  map f1 clear_terminal scrollback active
 Прокрутите содержимое экрана в прокрутку: map f1 clear_terminal scroll active
 Очистить все до строки с курсором:        map f1 clear_terminal to_cursor active
 Также можно переназначить Ctrl+L для прокрутки текущего содержимого экрана
 в буфер обратной прокрутки и очистки экрана вместо простой очистки экрана,
 например, для ZSH добавьте следующее в ~/.zshrc:
 .. code-block:: sh
      scroll-and-clear-screen() {
          printf '\n%.0s' {1..\$LINES}
          zle clear-screen
      }
      zle -N scroll-and-clear-screen
      bindkey '^l' scroll-and-clear-screen
\e[32m \e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map cmd+k clear_terminal to_cursor active\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m map kitty_mod+f5 load_config_file\e[0m
\e[32m map ctrl+cmd+,   load_config_file\e[0m
 Перезагрузите kitty.conf, применив все изменения с момента последней загрузки.
 Обратите внимание, что некоторые настройки не могут быть изменены динамически
 и требуют полной перезагрузки kitty. Вы также можете сопоставить привязку клавиш
 для загрузки другого файла конфигурации, например:
 map f5 load_config /path/to/alternative/kitty.conf
 Обратите внимание, что все настройки из оригинального kitty.conf отбрасываются,
 другими словами, новые настройки conf *заменяют* старые.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo "
 map kitty_mod+f6 debug_config
 map opt+cmd+,    debug_config
 Показать подробности о том, с какой именно конфигурацией работает Kitty
 и в какой среде находится. Полезно для отладки проблем. Отправлять произвольный
 текст при нажатии клавиш map ctrl+shift+alt+h send_text all Hello World
 Вы можете указать kitty отправлять произвольный (UTF-8) закодированный текст
 клиентской программе при нажатии указанных клавиш быстрого доступа. Например:
 map ctrl+alt+a send_text all Special text
 Это отправит «Специальный текст», когда вы нажмете комбинацию клавиш ctrl+alt+a.
 Отправляемый текст представляет собой строковый литерал Python, поэтому вы
 можете использовать escape-последовательности, такие как \\x1b, для отправки
 управляющих кодов или \\u21fb для отправки символов юникода (или вы можете просто
 ввести символы юникода непосредственно в виде текста UTF-8).
 Первый аргумент send_text — это режимы клавиатуры, в которых активируется ярлык.
 Возможные значения: normal, application, kitty или их комбинация, разделенная
 запятыми. Специальное ключевое слово all означает все режимы.
 Режимы normal и application относятся к режиму клавиши курсора DECCKM для
 терминалов, а kitty относится к специальный расширенный протокол клавиатуры
 kitty. Другой пример, который выводит слово, а затем перемещает курсор в начало
 строки (так же, как нажатие клавиши Home):
 map ctrl+alt+a send_text normal Word \\x1b[H
 map ctrl+alt+a send_text application Word \\x1bOH
";ES;fi;;
#
 14) S=M14;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
