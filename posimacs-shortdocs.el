;;; posimacs-shortdocs.el --- supplemental shortdocs  -*- lexical-binding: t -*-

;; Copyright (C) 2022 Positron Solutions

;; Author: Psionik K <73710933+psionic-k@users.noreply.github.com>
;; Keywords: shortdocs
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1"))

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Supplemental shortdocs for bootstrapping new users.
;; M-x shortdoc-display-group RET group RET
;; See the definitions below for the groups.

;;; Code:

(define-short-documentation-group eieio
  "Introspecting classes and objects"
  (symbol-plist
   :no-eval (symbol-plist 'magit-dispatch)
   :eg-result-string "(transient--prefix #<transient-prefix transient-prefix-20997da>)")
  (eieio-object-class
   :eval (eieio-object-class (get 'magit-dispatch 'transient--prefix)))
  (eieio-object-class-name
   :eval (eieio-object-class-name (get 'magit-dispatch 'transient--prefix)))
  (eieio-class-slots
   :no-eval (eieio-class-slots 'transient-prefix)
   :eg-result-string "list of slots")
  (find-class
   :no-eval (find-class 'transient-prefix)
   :eg-result-string "class struct")
  (describe-function
   :no-eval (describe-function 'transient-prefix)
   :eg-result-string "displays class constructor options in help buffer")
  (object-write
   :eval (get 'magit-dispatch 'transient--prefix))
  (oref
   :eval (oref (get 'magit-dispatch 'transient--prefix) command)
   :eval (oref (get 'magit-dispatch 'transient--prefix) history-pos))
  (slot-value
   :eval (slot-value (get 'magit-dispatch 'transient--prefix) 'scope)
   :eval (slot-value (get 'magit-dispatch 'transient--prefix) 'command))
  (child-of-class-p
   :eval (child-of-class-p transient-argument transient-child))
  (slot-exists-p
   :eval (slot-exists-p transient-argument 'level)
   :eval (slot-exists-p transient-argument 'command)
   :eval (slot-exists-p transient-argument 'not-a-real-slot))
  (slot-boundp
   :eval (slot-boundp (get 'magit-dispatch 'transient--prefix) 'command))
  (eieio-browse)
  "Defining and Overriding Classes"
  (defclass)
  (cl-defgeneric)
  (cl-defmethod)
  (oref)
  (oref-default)
  (oset)
  (oset-default)
  (cl-call-next-method)
  (cl-next-method-p))

(define-short-documentation-group transient
  "Macros for defining new instances."
  (transient-define-prefix)
  (transient-define-argument)
  (transient-define-infix)
  (transient-define-argument)
  (transient-define-groups)
  "Access during layout"
  (oref
   :no-manual t
   :no-eval (oref transient--prefix scope))
  "Access during suffix body"
  (transient-suffixes
   :no-eval (transient-suffixes 'magit-dispatch)
   :eg-result-string "Lots of suffix objects")
  (transient-args
   :eval (transient-args 'magit-dispatch))
  (transient-arg-value
   :eval (transient-arg-value "--flavor=" (transient-args transient-current-command)))
  "Flow control"
  (transient-setup
   :no-manual t
   :no-eval (transient-setup 'magit-dispatch)
   :no-eval (transient-setup 'magit-dispatch nil nil :scope nil))
  (transient--do-recurse :no-manual t)
  (transient--do-replace :no-manual t)
  (transient--do-call :no-manual t)
  (transient--do-stay :no-manual t)
  (transient--do-return :no-manual t)
  "Manipulating persistence & state"
  (transient-set-value)
  (transient-set)
  (transient-save)
  (transient-reset)
  (transient-reset-value)
  (transient-history-next)
  (transient-history-prev)
  "Readers for arguments"
  (transient-read-number-N+)
  (transient-read-number-N0)
  (transient-read-date)
  (transient-read-file)
  (transient-read-directory)
  (transient-read-existing-directory)
  (transient-read-existing-file)
  "Modifying Objects"
  (transient-parse-suffix
   :eval (transient-parse-suffix 'magit-dispatch '("a" "argument" "--argument=")))
  (transient-parse-suffixes
   :eval (transient-parse-suffix 'magit-dispatch [("a" "argument" "--argument=")]))
  (transient-get-suffix
   :eval (transient-get-suffix 'magit-dispatch "c")
   :eval (transient-get-suffix 'magit-dispatch 'magit-commit)
   :eval (transient-get-suffix 'magit-dispatch '(0 1 1)))
  (transient-remove-suffix)
  (transient-replace-suffix)
  (transient-insert-suffix)
  (transient-suffix-put)
  "Classes"
  (transient-prefix)
  (transient-suffix)
  (transient-infix)
  (transient-variable)
  (transient-child-variable)
  (transient-lisp-variable)
  (transient-argument)
  (transient-switches)
  (transient-option)
  (transient-files)
  (transient-switch)

  (transient-child)
  (transient-group)
  (transient-subgroups)
  (transient-columns)
  (transient-row)
  (transient-columns))

(define-short-documentation-group plist
  "Plists"
  (list
   :eval '(bar t foo 4))
  (plist-put
   :eval (plist-put '(bar t foo 4) 'baz 1.0))
  (plist-get
   :eval (plist-get '(bar t foo 4) 'foo)))

;; Let's just have enough forms to recall search keys for the rest and at least
;; hit on the main concepts.
(define-short-documentation-group dash
  "A modern list API for Emacs."
  (->
   :eval (-> '(2 3 5))
   :eval (-> '(2 3 5) (append '(8 13)))
   :eval (-> '(2 3 5) (append '(8 13)) (-slice 1 -1)))
  (->>
   :eval (->> '(1 2 3) (-sum)))
  (-->
   :eval (--> "def" (concat "abc" it "ghi")))
  (-some->>
   :eval (-some->> '(1 2 3) (--filter (= 0 (% it 2))) (--map (+ it 100)))
   :eval (-some->> '(1 3 5) (--filter (= 0 (% it 2))) (--map (+ it 100))))
  (-when-let*
   :eval (-when-let* ((x 5) (y 3) (z (+ y 4))) (+ x y z)))
  (-partial
   :eval (funcall (-partial #'+ 5 2) 3))
  (-rpartial
   :eval (funcall (-rpartial #'- 5 2) 10))
  (-filter
   :eval (-filter (lambda (x) (> x 0)) '(-2 -1 0 1 2)))
  (--filter
   :eval (--filter (= 0 (% it 2)) '(1 2 3 4)))
  (-slice
   :eval (-slice '(1 2 3 4 5) 1)
   :eval (-slice '(1 2 3 4 5) 0 3)
   :eval (-slice '(1 2 3 4 5 6 7 8 9) 1 -1 2))
  (-distinct
   :eval (-distinct '(1 1 2 3 3)))
  (-remove
   :eval (-remove (lambda (x) (> x 0)) '(-2 -1 0 1 2)))
  (--remove
   :eval (--remove (= 0 (% it 2)) '(1 2 3 4)))
  (-reduce
   :eval (-reduce #'- '(1 2 3 4)))
  (-sum
   :eval (-sum '(1 2 3 4)))
  (-zip
   :eval (-zip '(1 2 3) '(4 5 6)))
  (-flatten
   :eval (-flatten '((1 (2 3) (((4 (5))))))))
  (--all?
   :eval (--all? (= 0 (% it 2)) '(2 4 6))))

(shortdoc-add-function
 'overlay "Overlay Properties"
 '(overlay-properties
  :noeval (overlay-properties (car (overlays-in (point-min) (point-max))))
  :eg-result-string "(display
 #(\".\" 0 1
   (face
    (:foreground \"#b4b4b4\"))))
"))

(shortdoc-add-function
 'alist "Manipulating Alists"
 '(add-to-list
   :no-eval (add-to-list 'display-buffer-alist '(height . 79))
   :eg-result ((height . 79)
               (width . 80)
               (height . 2))

   :no-eval (add-to-list 'minibuffer-frame-alist '(height . 3))
   :eg-result ((height . 3)
               (height . 79)
               (width . 80)
               (height . 2))))

(shortdoc-add-function
 'vector "Operations on Vectors"
 '(elt
   :eval (elt [foo bar baz] 0)))

(define-short-documentation-group key-bindings
  "Converting keys for various functions"
  (kbd
   :eval (kbd "C-x l")
   :eval (kbd "C-u 4 C-k"))
  (key-description
   :eval (key-description [?\C-x ?l])
   :eval (key-description (kbd "C-u 4 C-p C-k"))
   :eval (key-description (kbd "C-k") (kbd "C-u")))
  (vconcat
   :eval (vconcat (kbd "C-u 4 C-p C-k"))
   :eval (key-description [21 52 16 11])
   :eval (key-description (vconcat (kbd "C-u 4 C-p C-k")))))

(define-short-documentation-group binding-and-conditionals
  "Binding variables and conditional forms."
  (let
      :eval (let ((foo "a") (bar "b")) (concat foo bar))
      :eval (let ((foo "a") (bar nil)) (format "foo: %s bar: %s" foo bar)))
  (when
      :eval (when t "foo")
      :eval (when nil "foo"))
  (unless
      :eval (unless t "foo")
      :eval (unless nil "bar"))
  (when-let
      :eval (when-let ((foo "a") (bar "b")) (concat foo bar))
      :eval (when-let ((foo "a") (bar nil)) (format "foo: %s bar: %s" foo bar)))
  (if-let*
      :eval (if-let* ((a 4) (b (+ a 1)) (c (+ b 1))) `(,a ,b ,c))
    :eval (if-let* ((a 4) (b (+ a 1)) (c (+ b 1)) (x nil)) `(,a ,b ,c)))
  (when-let
      :eval (when-let ((foo "bar")) (format "I got a %s" foo))
      :eval (when-let ((foo "bar") (baz nil)) (format "I got a %s" foo))
      :eval (when-let ((foo "bar") (baz nil)))
      :eval (when-let ((foo "bar") (baz "4"))))
  (and-let*
      :eval (and-let* ((foo "bar")) (format "I got a %s" foo))
      :eval (and-let* ((foo "bar") (baz nil)) (format "I got a %s" foo))
      :eval (and-let* ((foo "bar") (baz nil)))
      :eval (and-let* ((foo "bar") (baz "boo")))
      :eval (and-let* ((foo "bar") (baz (concat foo "boo")))))
  "Evaluate several forms but return one of the results."
  (progn
    :eval (progn (concat "a" "b") (concat "c" "d")))
  (prog1
    :eval (prog1 (concat "a" "b") (concat "c" "d")))
  (prog2
    :eval (prog2 (concat "a" "b") (concat "c" "d") (concat "e" "f"))))

(define-short-documentation-group advice
  "Checking advice on a function."
  (describe-function
   :no-eval (describe-function 'advice-function-member-p)
   :eg-result-string "help buffer describing `advice-function-member-p'.")
  (advice--symbol-function
   :eval (advice--symbol-function 'display-buffer))
  (advice--p
   :eval (advice--p (advice--symbol-function 'display-buffer))))

(provide 'posimacs-shortdocs)

;;; posimacs-shortdocs.el ends here
