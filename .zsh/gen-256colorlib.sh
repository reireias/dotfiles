#! /bin/bash

# gen-256colorlib.sh - 256色拡張の色指定を定義するスクリプトを生成する
# (C) 2008 kakurasan

# ライセンス : GPL-3
# 対応シェル : bash, zsh
# 使用例     : gen-256colorlib.sh > 256colorlib.sh && chmod +x 256colorlib.sh

# このスクリプトはbashのみに対応
if ! test -n "${BASH_VERSION:-}"; then
  echo "gen-256colorlib: error: this script only supports bash." >&2
  exit 1
fi

print_usage()
{
  cat <<EOF >&2
gen-256colorlib.sh: 256色拡張の色指定を定義するスクリプトを標準出力に書き出す

使用法: $(basename $0) (-z)
オプション:
  -z: zshのプロンプト用の色コード変数を出力したい場合に使用
EOF
}

ZSH_PS_MODE=0
while getopts 'hz' OPT
do
  case ${OPT} in
   z)
    ZSH_PS_MODE=1
    ;;
   ?)
    print_usage
    exit 2
    ;;
  esac
done

cat <<EOF
# 256colorlib.sh - 256色拡張の色指定を定義
# (C) 2008 kakurasan
# gen-256colorlib.shより生成

# 対応シェル : bash, zsh
# 使用例     : . 256colorlib.sh もしくは source 256colorlib.sh

# 定義される変数
#  COLOR_FG_rrggbb : 前景色を#rrggbbに変更
#  COLOR_BG_rrggbb : 背景色を#rrggbbに変更
#  STYLE_DEFAULT   : 色とスタイルをリセット
#  STYLE_BOLD      : 太字
#  STYLE_LINE      : 下線
#  STYLE_NEGA      : 前景色と背景色を入れ替える
#  STYLE_NOLINE    : 下線なし

# シェル判別
if test -n "\${BASH_VERSION:-}"; then
  USE_BASH=1
else
  USE_BASH=0
  if test -z "\${ZSH_VERSION:-}"; then
    echo "256colorlib: error: this script only supports bash or zsh." >&2
    exit 1
  fi
fi

# スタイルの指定と解除
EOF
if [[ ${ZSH_PS_MODE} -eq 0 ]]; then
cat <<EOF
STYLE_DEFAULT='\e[0m'
STYLE_BOLD='\e[1m'
STYLE_LINE='\e[4m'
STYLE_NEGA='\e[7m'
STYLE_NOLINE='\e[24m'
EOF
else
cat <<EOF
STYLE_DEFAULT=$'%{\e[0m%}'
STYLE_BOLD=$'%{\e[1m%}'
STYLE_LINE=$'%{\e[4m%}'
STYLE_NEGA=$'%{\e[7m%}'
STYLE_NOLINE=$'%{\e[24m%}'
EOF
fi

# カラーキューブ色: 216色(16-231)
# 16 + ( [赤成分(0-5)] x 36 ) + ( [緑成分(0-5)] x 6 ) + ( [青成分(0-5)] x 1 )
# R(赤)/G(緑)/B(青)各成分は0から5の値をとり
# 色コードはそれぞれ「0x00 0x5F 0x87 0xAF 0xd7 0xFF」となる
# (「0x00 0x33 0x66 0x99 0xCC 0xFF」では *ない* )
echo "# カラーキューブ色: 216色(16-231)"
COLORS=("00" "5F" "87" "AF" "D7" "FF")
for X in {16..231}; do
  R=$(( ( ${X} - 16 ) / 36 ))
  G=$(( ( (${X} - 16 ) % 36 ) / 6 ))
  B=$(( ( (${X} - 16 ) % 6 ) / 1 ))
  if [[ ${ZSH_PS_MODE} -eq 0 ]]; then
    echo "COLOR_FG_$(printf %s%s%s ${COLORS[${R}]} ${COLORS[${G}]} ${COLORS[${B}]})='\e[38;5;${X}m'"
    echo "COLOR_BG_$(printf %s%s%s ${COLORS[${R}]} ${COLORS[${G}]} ${COLORS[${B}]})='\e[48;5;${X}m'"
  else
    echo "COLOR_FG_$(printf %s%s%s ${COLORS[${R}]} ${COLORS[${G}]} ${COLORS[${B}]})=\$'%{\e[38;5;${X}m%}'"
    echo "COLOR_BG_$(printf %s%s%s ${COLORS[${R}]} ${COLORS[${G}]} ${COLORS[${B}]})=\$'%{\e[48;5;${X}m%}'"
  fi
done
unset R G B COLORS X

# グレースケール色: 24色(232-255)
echo -e "\n# グレースケール色: 24色(232-255)"
COLORS=("08" "12" "1C" "26" "30" "3A" "44" "4E" "58" "62" "6C" "76"
        "80" "8A" "94" "9E" "A8" "B2" "BC" "C6" "D0" "DA" "E4" "EE")
for X in {232..255}; do
  G=$(( ${X} - 232 ))  # R/G/Bの全てに共通
  if [[ ${ZSH_PS_MODE} -eq 0 ]]; then
    echo "COLOR_FG_$(printf %s%s%s ${COLORS[${G}]} ${COLORS[${G}]} ${COLORS[${G}]})='\e[38;5;${X}m'"
    echo "COLOR_BG_$(printf %s%s%s ${COLORS[${G}]} ${COLORS[${G}]} ${COLORS[${G}]})='\e[48;5;${X}m'"
  else
    echo "COLOR_FG_$(printf %s%s%s ${COLORS[${G}]} ${COLORS[${G}]} ${COLORS[${G}]})=\$'%{\e[38;5;${X}m%}'"
    echo "COLOR_BG_$(printf %s%s%s ${COLORS[${G}]} ${COLORS[${G}]} ${COLORS[${G}]})=\$'%{\e[48;5;${X}m%}'"
  fi
done
unset G COLORS X ZSH_PS_MODE

echo -e "\n# [EOF]"

# [EOF]
