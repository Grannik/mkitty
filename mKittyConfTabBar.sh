#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=28; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Панель вкладок ---------------------------- Tab bar --------------------------+\033[0m";
 TPUT 26 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 29 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  5 3; $e " На каком краю показывать панель вкладок    \e[32m tab_bar_edge                   \033[0m";}
  M1(){ TPUT  6 3; $e " Поле слева и справа от панели вкладок      \e[32m tab_bar_margin_width           \033[0m";}
  M2(){ TPUT  7 3; $e " Поле над и под панелью вкладок             \e[32m tab_bar_margin_height          \033[0m";}
  M3(){ TPUT  8 3; $e " Стиль панели вкладок                       \e[32m tab_bar_style                  \033[0m";}
  M4(){ TPUT  9 3; $e " Горизонтальное выравнивание панели вкладок \e[32m tab_bar_align                  \033[0m";}
  M5(){ TPUT 10 3; $e " Минимальное количество вкладок             \e[32m tab_bar_min_tabs               \033[0m";}
  M6(){ TPUT 11 3; $e " Алгоритм, при переключении на вкладку      \e[32m tab_switch_strategy            \033[0m";}
  M7(){ TPUT 12 3; $e " Kак вкладка исчезает в фоновом режиме      \e[32m tab_fade                       \033[0m";}
  M8(){ TPUT 13 3; $e " Разделитель между вкладками на панели      \e[32m tab_separator                  \033[0m";}
  M9(){ TPUT 14 3; $e " Стиль разделителя Powerline между вкладками\e[32m tab_powerline_style            \033[0m";}
 M10(){ TPUT 15 3; $e " Некоторый текст или символ Юникода         \e[32m tab_activity_symbol none       \033[0m";}
 M11(){ TPUT 16 3; $e " Шаблон для отображения заголовка вкладки   \e[32m tab_title_template             \033[0m";}
 M12(){ TPUT 17 3; $e " Шаблон для активных вкладок, если не указан\e[32m active_tab_title_template      \033[0m";}
 M13(){ TPUT 18 3; $e " Цвет указателя активного окна              \e[32m active_tab_foreground          \033[0m";}
 M14(){ TPUT 19 3; $e " Цвет фона активного окна                   \e[32m active_tab_background          \033[0m";}
 M15(){ TPUT 20 3; $e " Шрифт активного окна                       \e[32m active_tab_font_style          \033[0m";}
 M16(){ TPUT 21 3; $e " Цвет указателя не активного окна           \e[32m inactive_tab_foreground        \033[0m";}
 M17(){ TPUT 22 3; $e " Цвет фона не активного окна                \e[32m inactive_tab_background        \033[0m";}
 M18(){ TPUT 23 3; $e " Цвета и стили панели вкладок               \e[32m inactive_tab_font_style        \033[0m";}
 M19(){ TPUT 24 3; $e " Цвет фона для панели вкладок               \e[32m tab_bar_background             \033[0m";}
 M20(){ TPUT 25 3; $e " Цвет области поля панели вкладок           \e[32m tab_bar_margin_color           \033[0m";}
#
 M21(){ TPUT 27 3; $e " \e[90mExit                                                                       \033[0m";}
LM=21
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
 На каком краю показывать панель вкладок, сверху или снизу:
\e[32m tab_bar_edge\e[36m top\e[0m
\e[32m             \e[36m bottom\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Поле слева и справа от панели вкладок (в пунктах):
\e[32m tab_bar_margin_width 0.0\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Поле над и под панелью вкладок (в пунктах).
 Первое число — это поле между краем окна ОС и панелью вкладок,
 а второе число — это поле между панелью вкладок и содержимым текущей вкладки.
\e[32m tab_bar_margin_height 0.0 0.0\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Стиль панели вкладок может быть одним из следующих:

\e[36m fade\e[0m тускнеть
 Края каждой вкладки становятся цветом фона (см. tab_fade)

\e[36m slant\e[0m наклонный
 Вкладки выглядят как вкладки в физическом файле

\e[36m separator\e[0m разделитель
 Вкладки разделены настраиваемым разделителем (см. tab_separator)

\e[36m powerline\e[0m линия электропередачи
 Вкладки показаны сплошной линией с «причудливыми» разделителями.
 (см. tab_powerline_style)

\e[36m custom\e[0m обычай
 Пользовательская функция Python, называемая draw_tab, загружается из файла.
 tab_bar.py в каталоге конфигурации kitty.
 Для примеров того, как написать такую функцию,
 см. функции с именем draw_tab_with_* в исходный код kityy:
 kitty/tab_bar.py.
 Смотрите также это обсуждение:
 https://github.com/kovidgoyal/kitty/discussions/4447
 для примеров от пользователей kitty.

\e[36m hidden\e[0m скрытый
 Панель вкладок скрыта. Если вы используете это, вы можете создать сопоставление
 для: https://sw.kovidgoyal.net/kitty/actions/#select-tab действие,
 которое представляет вам список вкладок и позволяет легко переход на вкладку.

\e[32m tab_bar_style fade\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Горизонтальное выравнивание панели вкладок может быть одним из следующих:

\e[32m tab_bar_align\e[36m left\e[0m   слева
\e[36m               center\e[0m по центру
\e[36m               right \e[0m справа
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Минимальное количество вкладок,
 которое должно существовать до отображения панели вкладок
\e[32m tab_bar_min_tabs 2\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Алгоритм, используемый при переключении на вкладку, когда текущая вкладка закрыта
 По умолчанию предыдущий переключится на последнюю использованную вкладку.
 Значение left переключит на вкладку слева от закрытой вкладки.
 Значение right переключит на вкладку справа от закрытой вкладки.
 Значение last переключит на крайнюю правую вкладку.
\e[32m tab_switch_strategy previous\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Управляйте тем, как каждая вкладка исчезает в фоновом режиме при использовании
 затухания для tab_bar_style.
 Каждое число представляет собой альфа-канал (от нуля до единицы),
 который определяет степень перехода соответствующей ячейки в фон,
 при этом ноль означает отсутствие затухания, а единица — полное затухание.
 Вы можете изменить количество используемых ячеек, добавляя/удаляя записи.
 к этому списку:
\e[32m tab_fade 0.25 0.5 0.75 1\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Разделитель между вкладками на панели вкладок
 при использовании разделителя в качестве tab_bar_style
\e[32m tab_separator \" ┇\"\e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Стиль разделителя Powerline между вкладками на панели вкладок
 при использовании Powerline в качестве tab_bar_style
 может быть одним из следующих:
 angled  угловой
 slanted наклонный
 round   круглый
\e[32m tab_powerline_style angled\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Некоторый текст или символ Юникода для отображения на вкладке,
 если окно на вкладке, не имеющее фокуса, имеет некоторую активность.
 Если вы хотите использовать начальные или конечные пробелы, заключите
 текст в кавычки. См. tab_title_template, как это отображается.
\e[32m tab_activity_symbol none\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Шаблон для отображения заголовка вкладки.
 По умолчанию просто отображает заголовок с дополнительными символами для звонка
 и активности. Если вы также хотите включить индекс вкладок, используйте
 что-то вроде: {index}: {title}.
 Полезно, если у вас есть ярлыки, сопоставленные с goto_tab N.
 Если вы предпочитаете видеть индекс в виде надстрочного индекса,
 используйте {sup.index}.
 Кроме того, вы можете использовать {layout_name} для имени текущего макета,
 {num_windows} для количества окон на вкладке и {num_window_groups}
 для количества групп окон (не считая оверлейных окон) на вкладке.
 Обратите внимание, что форматирование выполняется механизмом форматирования
 строк Python, поэтому вы можете использовать, например, {layout_name[:2].upper()}
 чтобы отобразить только первые две буквы имени макета в верхнем регистре.
 Если вы хотите стилизовать текст, вы можете использовать директивы стиля,
 например:
 {fmt.fg.red}     красный
 {fmt.fg.tab}     нормальный
 {fmt.bg._00FF00} зеленый
 bg{fmt.bg.tab}   Аналогично для полужирного и курсивного:
 {fmt.bold}   жирный
 {fmt.nobold} обычный
 {fmt.italic} курсив
 {fmt.noitalic}.
 Обратите внимание, что для обратной совместимости, если {bell_symbol} или
 {activity_symbol} отсутствуют в шаблоне, они добавлены к нему.
\e[32m tab_title_template "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title}"\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Шаблон для активных вкладок, если он не указан,
 возвращается к tab_title_template:
\e[32m active_tab_title_template none\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Цвет указателя активного окна:
\e[32m active_tab_foreground #000\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m active_tab_background #ff4500\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m active_tab_font_style bold-italic\e[0m";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m inactive_tab_foreground #444\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m inactive_tab_background #999\e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m inactive_tab_font_style normal\e[0m";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Цвет фона для панели вкладок. По умолчанию используется цвет фона терминала:
\e[32m tab_bar_background none\e[0m";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Цвет области поля панели вкладок. По умолчанию используется терминал:
\e[32m tab_bar_margin_color none\e[0m
";ES;fi;;
#
 21) S=M21;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
