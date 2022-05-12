#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=13; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Cursor customization --------------------- Настройка курсора -----------------+\033[0m";
 TPUT 11 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 14 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 M0(){ TPUT 4 3; $e " Цвет курсора                               \e[32mcursor                           \e[0m";}
 M1(){ TPUT 5 3; $e " Выберите цвет текста под курсором          \e[32mcursor_text_color                \e[0m";}
 M2(){ TPUT 6 3; $e " Форма курсора                              \e[32mcursor_shape                     \e[0m";}
 M3(){ TPUT 7 3; $e " Определяет толщину курсора луча (в точках) \e[32mcursor_beam_thickness            \e[0m";}
 M4(){ TPUT 8 3; $e " Определяет толщину курсора подчеркивания   \e[32mcursor_underline_thickness       \e[0m";}
 M5(){ TPUT 9 3; $e " Интервал, с которым должен мигать курсор   \e[32mcursor_blink_interval            \e[0m";}
 M6(){ TPUT 10 3; $e " Перестать мигать курсором                  \e[32mcursor_stop_blinking_after       \e[0m";}
#
 M7(){ TPUT 12 3; $e " \e[90mExit                                                                        \e[0m";}
LM=7
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
#
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo -e "
 Цвет курсора по умолчанию. Если установлено специальное значение none,
 курсор будет отображаться с эффектом «обратного видео».
 Его цвет будет цветом текста в ячейке, над которой он находится,
 и текст будет отображаться с фоновым цветом ячейки.
 Обратите внимание, что если программа, работающая в терминале,
 устанавливает цвет курсора, он имеет приоритет.
 Кроме того, цвета курсора изменяются, если фон ячейки
 и цвета переднего плана имеют очень низкую контрастность.
\e[32m cursor #fc0f00\e[0m";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo -e "
 Если вы хотите, чтобы он отображался с цветом фона ячейки под ним,
 используйте специальное ключевое слово: background
 Обратите внимание,
 что если для курсора установлено значение none, этот параметр игнорируется.
\e[32m cursor_text_color #1111ff\e[0m";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo -e "
 Форма курсора может быть одной из (блок, луч, подчеркивание).
 Обратите внимание, что при перезагрузке конфигурации это будет изменено
 только в том случае, если форма курсора не была установлена программой,
 запущенной в терминале.
 Это устанавливает форму курсора по умолчанию.
 Приложения, запущенные в терминале, могут переопределить его.
 В частности: https://sw.kovidgoyal.net/kitty/shell-integration/
 в kitty устанавливает форму курсора, чтобы он сиял при подсказках оболочки.
 Вы можете избежать этого, установив для shell_integration значение no-cursor.
\e[32m cursor_shape \e[36mblock\e[0m
\e[32m              \e[36mbeam\e[0m
\e[32m              \e[36munderline\e[0m
";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m cursor_beam_thickness 5.5\e[0m";ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m cursor_underline_thickness 2.0\e[0m";ES;fi;;
  5) S=M5;SC;if [[ $cur == enter ]];then R;echo -e "
 Установите на ноль, чтобы отключить мигание.
 Отрицательные значения означают использование системы по умолчанию.
 Обратите внимание, что числа меньше, чем repaint_delay, будут ограничены.
\e[32m cursor_blink_interval\e[36m 0
                       1\e[0m";ES;fi;;
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo -e "
 Перестать мигать курсором,
 после указанного количества секунд бездействия клавиатуры.
 Установите на ноль, чтобы никогда не переставать мигать.
\e[32m cursor_stop_blinking_after 12.0 \e[0m
";ES;fi;;
#
  7) S=M7;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
