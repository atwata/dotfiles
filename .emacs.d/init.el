;; パッケージ管理
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; スタート時のスプラッシュ非表示
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 行番号を表示
(global-linum-mode t)

;; 起動時のサイズ,表示位置,フォントを指定
(setq initial-frame-alist
      (append (list
;	       '(width . 150)
;	       '(height . 55)
;	       '(top . 20)
;	       '(left . 20)
	       '(font . "ＭＳ ゴシック-10")
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; スクリーンの最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; テーマの指定
(load-theme 'adwaita t)

;; ツールバーを非表示
(tool-bar-mode 0)

;; 現在行をハイライト
(global-hl-line-mode t)

;; 最近使ったファイルの履歴を有効にする
(require 'recentf)
(setq recentf-max-saved-items 2000)
(recentf-mode 1)
; デフォルトキーバインドがないのでC-x C-rに指定
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;; 起動時のウインドウ分割(dired)
;(add-hook 'after-init-hook (lambda()
;    (setq w (selected-window))
;    (setq w2 (split-window w 25 t))
;    (select-window w)
;    (dired "C:/root")
;    (select-window w2)
;))

;; sr-speed-bar
(require 'sr-speedbar) 
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 20)
(setq sr-speedbar-width-x 20)
(setq sr-speedbar-width-console 20)
; フォルダなどを画像で表示しない
(setq speedbar-use-images nil)
; 開いているファイルに連動してディレクトリ展開を変更しない
(sr-speedbar-refresh-turn-off)
; 追加で表示する拡張子登録
(add-hook 'speedbar-mode-hook
    '(lambda ()
        (speedbar-add-supported-extension '("txt" "html" "php" "css" "js"))))
(sr-speedbar-open)
; 起動をF5に割り当てる
(global-set-key (kbd "<f5>") 'sr-speedbar-toggle)



(defun outtree ()
  "outline-tree
見出しを別ウィンドウで表示させる.
by yama @ Thu Mar 29 23:37:45 2007"
  (interactive)
  (if 'outline-mode (outline-mode))
  (hide-body)
  (let* ((basename (princ (buffer-name)))
         (newtmp (concat basename "-tree")))
    (if (get-buffer newtmp)
        (unless (get-buffer-window newtmp)
            (split-window-vertically 10)
            (switch-to-buffer newtmp)
            (other-window 1))
      (progn
        (make-indirect-buffer (current-buffer) newtmp)
        (split-window-vertically 10)
        (switch-to-buffer newtmp)
        (if 'outline-mode (outline-mode))
        (hide-sublevels 1)
        (other-window 1)))))

;; tabbar

(require 'tabbar)
(tabbar-mode 1)

; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

; グループ化しない
(setq tabbar-buffer-groups-function nil)

; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

; タブの長さ
(setq tabbar-separator '(1.5))

; Chrome ライクなタブ切り替えのキーバインド
(global-set-key (kbd "<C-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-left>") 'tabbar-backward-tab)



; php-mode
(require 'php-mode)


