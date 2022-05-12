#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=35; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Цвета переднего плана и фона ------------- Foreground and background colors --+\e[0m";
 TPUT 4 3
        $E "\e[90m Есть 8 основных цветов, у каждого цвета есть тусклая и яркая версия,";
 TPUT 5 3
        $E " для первых 16 цветов.";
 TPUT 6 3
        $E " Вы можете установить оставшиеся 240 цветов от color16 до color255.\e[0m";
 TPUT 18 1
        $E "\033[0m\033[35m+- 256 терминальных цветов ------------------ The 256 terminal colors -----------+\033[0m";
 TPUT 33 1
        $E "\033[0m\033[35m+--- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ---------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
   FOOT(){ MARK;TPUT 36 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
  M0(){ TPUT  7 3; $e " Цвета переднего плана                        \e[32m foreground                    \033[0m";}
  M1(){ TPUT  8 3; $e " Цвета переднего фона                         \e[32m background                    \033[0m";}
  M2(){ TPUT  9 3; $e " Непрозрачность фона                          \e[32m background_opacity            \033[0m";}
  M3(){ TPUT 10 3; $e " Путь к фоновому изображению                  \e[32m background_image              \033[0m";}
  M4(){ TPUT 11 3; $e " Мозаика, масштабирование или зажим           \e[32m background_image_layout       \033[0m";}
  M5(){ TPUT 12 3; $e " Когда фоновое изображение масштабируется     \e[32m background_image_linear       \033[0m";}
  M6(){ TPUT 13 3; $e " Разрешить изменение background_opacity       \e[32m dynamic_background_opacity    \033[0m";}
  M7(){ TPUT 14 3; $e " Насколько тонировать фоновое изображение     \e[32m background_tint               \033[0m";}
  M8(){ TPUT 15 3; $e " Насколько затемнить текст                    \e[32m dim_opacity                   \033[0m";}
  M9(){ TPUT 16 3; $e " Цвета переднего плана, выделенного мышью     \e[32m selection_foreground          \033[0m";}
 M10(){ TPUT 17 3; $e " Цвета фона, выделенного мышью                \e[32m selection_background          \033[0m";}
#
 M11(){ TPUT 19 3; $e " черный    цвет                               \e[32m black                         \033[0m";}
 M12(){ TPUT 20 3; $e " красный   цвет                               \e[32m red                           \033[0m";}
 M13(){ TPUT 21 3; $e " зеленый   цвет                               \e[32m green                         \033[0m";}
 M14(){ TPUT 22 3; $e " желтый    цвет                               \e[32m yellow                        \033[0m";}
 M15(){ TPUT 23 3; $e " синий     цвет                               \e[32m blue                          \033[0m";}
 M16(){ TPUT 24 3; $e " пурпурный цвет                               \e[32m magenta                       \033[0m";}
 M17(){ TPUT 25 3; $e " голубой                                      \e[32m cyan                          \033[0m";}
 M18(){ TPUT 26 3; $e " белый                                        \e[32m white                         \033[0m";}
 M19(){ TPUT 27 3; $e " Цвет для меток типа 1                        \e[32m mark1_foreground              \033[0m";}
 M20(){ TPUT 28 3; $e " Цвет для марок типа 1 (светло-стальной синий)\e[32m mark1_background              \033[0m";}
 M21(){ TPUT 29 3; $e " Цвет для меток типа 2                        \e[32m mark2_foreground              \033[0m";}
 M22(){ TPUT 30 3; $e " Цвет для марок типа 1 (бежевый)              \e[32m mark2_background              \033[0m";}
 M23(){ TPUT 31 3; $e " Цвет для меток типа 3                        \e[32m mark3_foreground              \033[0m";}
 M24(){ TPUT 32 3; $e " Цвет меток типа 3 (фиолетовый)               \e[32m mark3_background              \033[0m";}
#
 M25(){ TPUT 34 3; $e " \e[90mExit                                                                        \033[0m";}
LM=25
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m foreground #fff\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m background #000\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Непрозрачность фона. Число от 0 до 1, где 1 — непрозрачный, а 0 — полностью про-
 зрачный. Это будет работать только в том случае, если поддерживается ОС (напри-
 мер, при использовании композитора под X11). Обратите внимание, что он устанавли-
 вает непрозрачность цвета фона только в ячейках, которые имеют тот же цвет фона,
 что и фон терминала по умолчанию. Это сделано для того, чтобы такие вещи, как
 строка состояния в vim, подсказки Powerline и т. д., по-прежнему выглядели хоро-
 шо. Но это означает, что если вы используете цветовую тему с цвет фона в вашем
 редакторе, он не будет отображаться как прозрачный. Вместо этого вы должны изме-
 нить цвет фона по умолчанию в конфигурации вашего kitty и не использовать цвет
 фона в цветовой схеме редактора. Или используйте escape-коды, чтобы установить
 цвета терминала по умолчанию в сценарии оболочки для запуска вашего редактора.
 Быть в курсе, что использование значения меньше 1,0 является (возможно, значите-
 льным) ударом по производительности. Если вы хотите динамически изменять прозра-
 чность окон, установите для параметра dynamic_background_opacity значение yes
 (это значение по умолчанию отключено, так как это влияет на производительность).
 Изменение этого параметра при перезагрузке конфигурации будет работать только в
 том случае, если в исходной конфигурации была включена функция:
 dynamic_background_opacity.
\e[32m background_opacity 1.0\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Путь к фоновому изображению. Должен быть в формате PNG:
\e[32m background_image none\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Мозаика, масштабирование или зажим фонового изображения.
 Значение может быть одним из:
 tiled        мозаичных
 mirror-tiled зеркальных
 scaled       масштабированных
 clamped      зажатых
\e[32m background_image_layout tiled\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Когда фоновое изображение масштабируется,
 следует ли использовать линейную интерполяцию:
\e[32m background_image_linear no\e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Разрешить динамическое изменение background_opacity, используя либо сочетания
 клавиш (increase_background_opacity и ecrease_background_opacity),
 либо средства удаленного управления.
 Изменение этого параметра путем перезагрузки конфигурации не поддерживается.
\e[32m dynamic_background_opacity no\e[0m
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Насколько тонировать фоновое изображение по цвету фона.
 Оттенок применяется только к текстовой области, а не к полям/границам.
 Облегчает чтение текста.
 Тонировка выполняется с использованием текущего цвета фона для каждого окна.
 Этот параметр применяется только в том случае, если установлено значение
 background_opacity и поддерживаются прозрачные окна
 или установлено значение background_image.
 \e[32m background_tint 0.0\e[0m
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Насколько затемнить текст с установленным атрибутом DIM/FAINT.
 Единица означает отсутствие затемнения, а ноль означает полное затемнение
 (т. е. невидимость).
\e[32m dim_opacity 0.75\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Цвета переднего плана и фона для текста, выделенного мышью.
 Установка для обоих этих параметров значения none приведет к эффекту
 «обратного видео» для выделения, где выделение будет цветом текста ячейки,
 а текст станет цветом фона ячейки.
 Установка для параметра only selection_foreground значения none приведет к тому,
 что цвет переднего плана будет использоваться без изменений.
 Обратите внимание, что эти цвета могут быть переопределены программой,
 работающей в терминале.
\e[32m selection_foreground #000000\e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m selection_background #fffacd\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color0 #000000\e[0m
\e[32m color8 #767676\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color1 #cc0403\e[0m
\e[32m color9 #f2201f\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color2 #19cb00\e[0m
\e[32m color10 #23fd00\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color3 #cecb00\e[0m
\e[32m color11 #fffd00\e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color4 #0d73cc\e[0m
\e[32m color12 #1a8fff\e[0m";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color5 #cb1ed1\e[0m
\e[32m color13 #fd28ff\e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color6 #0dcdcd\e[0m
\e[32m color14 #14ffff\e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m color7  #dddddd\e[0m
\e[32m color15 #ffffff\e[0m";ES;fi;;
#
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e " Цвет для меток типа 1\e[32m mark1_foreground black\e[0m";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e " Цвет для марок типа 1 (светло-стальной синий)\e[32m mark1_background #98d3cb\e[0m";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e " Цвет для меток типа 2\e[32m mark2_foreground black\e[0m";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e " Цвет для марок типа 1 (бежевый)\e[32m mark2_background #f2dcd3\e[0m";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e " Цвет для меток типа 3\e[32m mark3_foreground black\e[0m";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e " Цвет меток типа 3 (фиолетовый)\e[32m mark3_background #f274bc\e[0m";ES;fi;;
#
 25) S=M25;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
