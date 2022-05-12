 E='echo -e';    # -e включить поддержку вывода Escape последовательностей
 e='echo -en';   # -n не выводить перевод строки
 c="\033[0m\033[45;30m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m"
 d="\033[0m\033[35m+--------------------------------------------------------------------------------+\033[0m"
 i=0; CLEAR; CIVIS;NULL=/dev/null
 trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
 CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;45m";}
 UNMARK(){ $e "\e[0m";}
 R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
