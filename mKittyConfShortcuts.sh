#!/bin/bash
source "sKitty.sh"
 HEAD(){ for (( a=2; a<=14; a++ ))
  do
 TPUT $a 1
        $E "\033[1;35m\xE2\x94\x82                                                                                \xE2\x94\x82\033[0m";
  done
 TPUT 3 1
        $E "\033[0m\033[35m+- Горячие клавиши ---------------------------------- Keyboard shortcuts --------+\033[0m";
 TPUT 12 1
        $E "\033[0m\033[35m+- Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter -----------------------------------------------------+\033[0m";
 MARK;TPUT 1 1
        $E "$c";UNMARK;}
   i=0; CLEAR; CIVIS;NULL=/dev/null
# 32 это расстояние сверху и 48 это расстояние слева
 FOOT(){ MARK;TPUT 15 1
        $E "$c";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
  M0(){ TPUT  5 3; $e " Ключи идентифицируются символами Unicode          \e[32m Unicode                  \e[0m";}
  M1(){ TPUT  6 3; $e " использовать имена ключей XKB для привязки ключей \e[32m XKB                      \e[0m";}
  M2(){ TPUT  7 3; $e " использовать необработанные коды системных ключей для сопоставления ключей ";}
  M3(){ TPUT  8 3; $e " используется модификаторom по умолчанию           \e[32m kitty_mod ctrl+shift     \e[0m";}
  M4(){ TPUT  9 3; $e " удалить все определения ярлыков                   \e[32m clear_all_shortcuts      \e[0m";}
  M5(){ TPUT 10 3; $e " чтобы избежать повторения тех же параметров       \e[32m action_alias             \e[0m";}
  M6(){ TPUT 11 3; $e " Аналогично action_alias выше, специально для kitty\e[32m kitten_alias             \e[0m";}
#
  M7(){ TPUT 13 3; $e "\e[32m Exit                                                                        \e[0m";}
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Ключи идентифицируются просто символами Unicode в нижнем регистре.
 Например: \`\`a\`\` для клавиши A, \`\`[\`\` для клавиши левой квадратной скобки и т. д.
 Для функциональных клавиш, таких как \`\`Enter или Escape\`\`, имена присутствуют на:
 https://sw.kovidgoyal.net/kitty/keyboard-protocol/#functional-key-definitions
 Для клавиш-модификаторов используются следующие имена:
 ctrl (control, ⌃), shift (⇧), alt (opt, option, ⌥), super (cmd, команда, ⌘).
 См. также: Моды GLFW
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 В Linux вы также можете использовать имена ключей XKB для привязки ключей, kitty
 не поддерживаются GLFW. См. ключи XKB
 https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
 для списка ключевых имен. Используемое имя — это часть после префикса XKB_KEY_
 Обратите внимание, что вы можете использовать имя ключа XKB только для ключей,
 которые не известны как ключи GLFW.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Наконец, вы можете использовать необработанные коды системных ключей для сопоста-
 вления ключей, опять же только для ключей, которые не известны как ключи GLFW.
 Чтобы увидеть системный ключ код для ключа, запустите kitty с опцией:
\e[32m kitty --debug-input\e[0m
 Затем kitty будет выводить отладочный текст для каждого ключевого события.
 В этом text ищите \`\`native_code\`\`,
 значение которого становится именем ключа в ярлыке. Например:
 .. code-block:: none
 on_key_input: glfw key: 65 native_code: 0x61 action: PRESS mods: 0x0 text: 'a'
 Здесь имя ключа для ключа A — 0x61, и вы можете использовать его с ::
 map ctrl+0x61 something
 сопоставить ctrl+a с чем-то. Вы можете использовать специальное действие no_op,
 чтобы отменить сопоставление сочетания клавиш, назначенного в конфигурации
 по умолчанию:
 map kitty_mod+space no_op
 Если вы хотите, чтобы kitty полностью игнорировал ключевое событие, даже не
 отправляя его в программу, работающую в терминале, сопоставьте его с
 discard_event::
 map kitty_mod+f1 discard_event
 Вы можете комбинировать несколько действий, которые будут запускаться одним
 ярлыком, используя приведенный ниже синтаксис:
 Например:
 map kitty_mod+e combine : new_window : next_layout
 это создаст новое окно и переключится на следующий доступный макет.
 Вы можете использовать сочетания клавиш с несколькими клавишами,
 используя синтаксис, показанный ниже:
 map key1>key2>key3 action
 Например:
 map ctrl+f>2 set_font_size 20
 Полный список действий, которые можно сопоставить с нажатиями клавиш,
 доступен здесь </actions>.
\e[32m \e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Значение kitty_mod используется в качестве модификатора для всех ярлыков по умол-
 чанию, вы можете изменить его в файле kitty.conf, чтобы изменить модификаторы для
 всех ярлыков по умолчанию.
\e[32m kitty_mod ctrl+shift\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Вы можете попросить kitty удалить все определения ярлыков, которые вы видели до
 этого момента. Полезно, например, для удаления ярлыков по умолчанию.
\e[32m clear_all_shortcuts no\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Например. action_alias launch_tab launch --type=tab --cwd=current Определите
 псевдонимы, чтобы избежать повторения одних и тех же параметров в нескольких со-
 поставлениях. Псевдонимы могут быть определены для.
 map f1 launch_tab vim
 map f2 launch_tab emacs
 Аналогично вызову псевдонима kitty:
 action_alias hints kitten hints --hints-offset=0
\e[32m action_alias\e[0m
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Например. kitty_alias hints hints --hints-offset=0 Аналогично action_alias выше,
 но специально для kitty. Как правило, лучше использовать action_alias.
 Эта опция является устаревшей версией, представленной для обратной совместимости.
 Это приводит к замене всех вызовов kitty с псевдонимом.
 Таким образом, приведенный выше пример приведет к тому,
 что ко всем вызовам kitty подсказок будет применена опция --hints-offset=0
\e[32m kitten_alias\e[0m
";ES;fi;;
#
  7) S=M7;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
