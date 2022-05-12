#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=9; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Настройка производительности ------------- Performance tuning ----------------+\033[0m";
 TPUT 7 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 10 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  4 3; $e " Задержка обновления экрана                 \e[32mrepaint_delay                    \033[0m";}
  M1(){ TPUT  5 3; $e " Задержка перед обработкой ввода            \e[32minput_delay                      \033[0m";}
  M2(){ TPUT  6 3; $e " Синхронизируйте обновления экрана          \e[32msync_to_monitor                  \033[0m";}
#
  M3(){ TPUT  8 3; $e " \e[90mExit                                                                        \033[0m";}
LM=3
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
 Задержка (в миллисекундах) между обновлениями экрана.
 Уменьшение его увеличивает количество кадров в секунду (FPS) за счет большей
 загрузки ЦП. Значение по умолчанию дает ~100 кадров в секунду, что более чем
 достаточно для большинства применений. Обратите внимание, что для фактического
 достижения 100 FPS вам необходимо либо установить для sync_to_monitor значение
 no, либо использовать монитор с высокой частотой обновления. Кроме того, чтобы
 свести к минимуму задержку при наличии ожидающих обработки входных данных,
 параметр repaint_delay игнорируется.
\e[32m repaint_delay 10\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Задержка (в миллисекундах) перед обработкой ввода из программы, запущенной в
 терминале. Обратите внимание, что его уменьшение повысит скорость отклика, но
 также увеличит Использование ЦП и может вызвать мерцание в полноэкранных
 программах, которые перерисовывают весь экран в каждом цикле, потому что kitty
 настолько быстр, что частичные обновления экрана будут нарисовано.
\e[32m input_delay 3\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Синхронизируйте обновления экрана с частотой обновления монитора.
 Это предотвращает разрыв: https://en.wikipedia.org/wiki/Screen_tearing
 при прокрутке. Однако он ограничивает скорость рендеринга частотой обновления
 вашего монитора. При очень высокой скорости повторения мыши/клавиатуры вы
 можете заметить небольшую задержку ввода.
 Если это так, установите для этого параметра значение «нет».
\e[32m sync_to_monitor yes\e[0m";ES;fi;;
#
  3) S=M3;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
