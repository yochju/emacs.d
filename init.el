;;; init.el --- Entry point for all things Emacs
;;
;;; Commentary:
;;
;; This file gets executed first.
;;
;;; Code:

;; Start a background server if one isn't already running
(require 'server)
(unless (server-running-p)
  (server-start))

;;;
;;; Loadpath
;;;

; Set the site-lisp directory as a variable to be used in other config files
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq user-config-dir
      (expand-file-name "config" user-emacs-directory))

(defun add-to-loadpath (&rest paths)
  "Adds a series of paths to the loadpath."
  (mapc (apply-partially 'add-to-list 'load-path) paths))

;; Add common paths to loadpath
(add-to-loadpath user-emacs-directory
                 site-lisp-dir
                 user-config-dir)

;; Recursively add the contents of `user-config-dir` to the loadpath. This allows us to organize the
;; `config` directory in subdirectories
(let ((default-directory user-config-dir))
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-elpa)
(require 'ndhoule-init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" default))))
