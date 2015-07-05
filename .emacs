;; load paths
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(package-initialize)

;; indentation
(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)

(setq-default column-number-mode t)
(setq-default line-number-mode t)

(require 'column-marker)
(add-hook 'latex-mode-hook (lambda () (interactive) (column-marker-1 80)))
(column-marker-1 80)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs lines-tail))
(global-whitespace-mode 1)

(setq-default show-trailing-whitespace t)

(defun revert-all-buffers ()
  (interactive)
  (let ((current-buffer (buffer-name)))
    (loop for buf in (buffer-list)
          do
          (unless (null (buffer-file-name buf))
            (switch-to-buffer (buffer-name buf))
            (revert-buffer nil t)))
    (switch-to-buffer current-buffer)
    (message "All buffers reverted!")))

(global-auto-revert-mode 1)

;; Copying/Cutting in console emacs will add it to your mac clipboard
;; Need to also "sudo ym install xclip" along with installing xcip.el
;; Need to also enable X11 Forwarding & trusted X11 Forwarding (ssh -X -Y)
(require 'xclip)
(turn-on-xclip)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region) ; smart enough to toggle between commenting and uncommenting

;; will scroll one line at a time instead of jumping on cursor up/down
(require 'smooth-scrolling)

;; go to last edit location (super useful)
(require 'goto-last-change)
(global-set-key "\C-q" 'goto-last-change)

;; tree representation of changes to to walk the undo/redo graph. "C-x u" to open tree for current file.
(require 'undo-tree)
(global-undo-tree-mode)

