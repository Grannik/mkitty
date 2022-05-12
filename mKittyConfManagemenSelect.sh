#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=16; a++ ))
  do
 TPUT $a 1
  $E "\e[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
 TPUT 3 1
  $E "\e[35m+- Выбор и действие с видимым текстом ------- Select and act on visible text ----+\e[0m";
 TPUT 4 3
  $E "\e[90mИспользуйте kitty подсказок, чтобы выделить текст и либо передать его внешней\e[0m";
 TPUT 5 3
  $E "\e[90mпрограмме, либо вставить в терминал, либо скопировать в буфер обмена.\e[0m";
 TPUT 14 1
  $E "\e[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\e[0m";
 MARK;TPUT 1 1
  $E "$c";UNMARK;}
 FOOT(){ MARK;TPUT 17 1;$E "$c";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Открыть URL                                \e[32m Open URL                        \e[0m";}
  M1(){ TPUT  7 3; $e " Вставить выбранный путь                    \e[32m Open selected path              \e[0m";}
  M2(){ TPUT  8 3; $e " Выберите путь/имя файла и откройте его     \e[32m Select a path/filename          \e[0m";}
  M3(){ TPUT  9 3; $e " Вставить выбранную строку                  \e[32m Insert selected line            \e[0m";}
  M4(){ TPUT 10 3; $e " Вставить выбранное слово                   \e[32m Insert selected word            \e[0m";}
  M5(){ TPUT 11 3; $e " Выберите что-то похожее на хэш и вставьте его в терминал                    \e[0m";}
  M6(){ TPUT 12 3; $e " Открыть выбранный файл в выбранной строке                                   \e[0m";}
  M7(){ TPUT 13 3; $e " Открыть выбранную гиперссылку                                               \e[0m";}
#
  M8(){ TPUT 15 3; $e " \e[90mExit                                                                        \e[0m";}
LM=8
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
 Откройте текущий видимый URL-адрес с помощью клавиатуры.
 Программа, используемая для открытия URL-адреса, указана в open_url_with:
\e[32m map kitty_mod+e open_url_with_hints\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Вставить выбранный путь:
\e[32m map kitty_mod+p>f kitten hints --type path --program -\e[0m
 Выберите путь/имя файла и вставьте его в терминал.
 Полезно, например, для запуска команд git для имени файла,
 выведенного из предыдущей команды git.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Выберите путь/имя файла и откройте его с помощью программы открытия по умолчанию.
\e[32m map kitty_mod+p>shift+f kitten hints --type path\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Вставить выбранную строку
\e[32m map kitty_mod+p>l kitten hints --type line --program -\e[0m
 Выберите строку текста и вставьте ее в терминал.
 Используйте для вывода такие вещи, как: ls -1
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Выберите слова и вставьте в терминал.
\e[32m map kitty_mod+p>w kitten hints --type word --program -\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Выберите что-то похожее на хэш и вставьте его в терминал.
 Полезно с git, который использует хэши sha1 для идентификации коммитов.
\e[32m map kitty_mod+p>h kitten hints --type hash --program -\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Открыть выбранный файл в выбранной строке
\e[32m map kitty_mod+p>n kitten hints --type linenum\e[0m
 Выберите что-то похожее на имя файла:linenum
 и откройте его в vim с указанным номером строки.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Открыть выбранную гиперссылку:
\e[32m map kitty_mod+p>y kitten hints --type hyperlink\e[0m
 Выберите гиперссылку (т. е. URL-адрес, помеченный терминальной программой,
 например, командой ls --hyperlink=auto).
 kitty подсказок имеет гораздо больше режимов работы, которые вы можете
 сопоставить с различными ярлыками.
 Полное описание смотрите в разделе kittens/hints.
";ES;fi;;
#
 8) S=M8;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
