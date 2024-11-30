;;; cobrakai-theme.el --- An elegant dark theme -*- lexical-binding: t -*-

;; Copyright (C) 2024 Jakub Zika <zikajk@gmail.com>

;; Author: Jakub Zika <zikajk@gmail.com>
;; URL: https://github.com/zikajk/emacs-cobrakai-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; Created: 30 December 2024
;; Keywords: themes faces

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; CobraKai is a dark theme inspired by various Kanagawa themes and Nord theme.
;; Original Kanagawa theme created by rebelot see: https://github.com/rebelot/kanagawa.nvim
;; Original Nord theme see: https://github.com/nordtheme/emacs

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

;;; Customizations:

(defgroup cobrakai-theme nil
  "CobraKai-theme options."
  :group 'faces)

(defcustom cobrakai-theme-minimal nil
  "Unifies some colors, resulting in less color code"
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-comment-italic t
  "Enable italics for comments and also disable background."
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-keyword-italic t
  "Enable italics for keywords."
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-org-bold t
  "Inherit text bold for org headings"
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-org-priority-bold t
  "Inherit text bold for priority items in agenda view"
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-org-highlight nil
  "Highlight org headings."
  :type 'boolean
  :group 'cobrakai-theme)

(defcustom cobrakai-theme-underline-parens t
  "If non-nil, underline matching parens when using `show-paren-mode' or similar."
  :type 'boolean
  :group 'cobrakai-theme)

(defun true-color-p ()
  (or (display-graphic-p)
      (= (tty-display-color-cells) 16777216)))

(deftheme cobrakai "An elegant dark theme")

(defconst cobrakai-dark-palette
 `((white-0          ,(if (true-color-p) "#DCD7BA" "#ffffff"))
   (white-1          ,(if (true-color-p) "#C8C093" "#ffffff"))
   (black-0          ,(if (true-color-p) "#16161D" "#000000"))
   (black-1          ,(if (true-color-p) "#1F1F28" "#080808"))
   (black-1b         ,(if (true-color-p) "#1F1F28" "#000000"))
   (black-2          ,(if (true-color-p) "#2A2A37" "#121212"))
   (gray-1           ,(if (true-color-p) "#363646" "#303030"))
   (gray-2           ,(if (true-color-p) "#54546D" "#303030"))
   (gray-2b          ,(if (true-color-p) "#54536D" "#4e4e4e"))
   (gray-3           ,(if (true-color-p) "#717C7C" "#717C7C"))
   (ash-gray         ,(if (true-color-p) "#727169" "#717C7C"))
   (navy-1           ,(if (true-color-p) "#252535" "#585858"))
   (navy-2           ,(if (true-color-p) "#223249" "#4e4e4e"))
   (navy-3           ,(if (true-color-p) "#2D4F67" "#585858"))
   (steel            ,(if (true-color-p) "#658594" "#658594"))
   (teal-1           ,(if (true-color-p) "#6A9589" "#6a9589"))
   (teal-2           ,(if (true-color-p) "#7AA89F" "#717C7C"))
   (green-0          ,(if (true-color-p) "#2B3328" "#585858"))
   (green-1          ,(if (true-color-p) "#76946A" "#585858"))
   (green-2          ,(if (true-color-p) "#98BB6C" "#717C7C"))
   (olive            ,(if (true-color-p) "#49443C" "#585858"))
   (red-0            ,(if (true-color-p) "#C34043" "#585858"))
   (red-1            ,(if (true-color-p) "#E82424" "#585858"))
   (red-2            ,(if (true-color-p) "#FF5D62" "#717C7C"))
   (red-3            ,(if (true-color-p) "#E46876" "#717C7C"))
   (pink             ,(if (true-color-p) "#D27E99" "#717C7C"))
   (maroon           ,(if (true-color-p) "#43242B" "#585858"))
   (purple           ,(if (true-color-p) "#957FB8" "#717C7C"))
   (lavender-1       ,(if (true-color-p) "#938AA9" "#717C7C"))
   (lavender-2       ,(if (true-color-p) "#9CABCA" "#717C7C"))
   (blue-0           ,(if (true-color-p) "#7E9CD8" "#717C7C"))
   (blue-1           ,(if (true-color-p) "#7FB4CA" "#717C7C"))
   (blue-2           ,(if (true-color-p) "#A3D4D5" "#717C7C"))
   (khaki-1          ,(if (true-color-p) "#938056" "#717C7C"))
   (khaki-2          ,(if (true-color-p) "#C0A36E" "#717C7C"))
   (yellow           ,(if (true-color-p) "#E6C384" "#717C7C"))
   (orange           ,(if (true-color-p) "#FF9E3B" "#585858"))
   (peach            ,(if (true-color-p) "#FFA066" "#717C7C"))
   (mustard          ,(if (true-color-p) "#DCA561" "#585858"))))

(defmacro define-cobrakai-dark-theme (theme &rest faces)
  `(let ((class '((class color) (min-colors 89)))
         ,@cobrakai-dark-palette)
     (custom-theme-set-faces
      ,theme
      ,@faces)))

(define-cobrakai-dark-theme
 'cobrakai
 `(default                                       ((,class (:background ,black-1b :foreground ,white-0))))
 `(border                                        ((,class (:background ,black-1b :foreground ,black-0))))
 `(button                                        ((,class (:foreground ,teal-2))))
 `(child-frame                                   ((,class (:background ,black-0 :foreground ,black-0))))
 `(child-frame-border                            ((,class (:background ,black-0 :foreground ,black-0))))
 `(cursor                                        ((,class (:background ,blue-2 :foreground ,black-0 :weight bold))))
 `(error                                         ((,class (:foreground ,red-1))))
 `(fringe                                        ((,class (:foreground ,gray-1))))
 `(glyph-face                                    ((,class (:background ,gray-2))))
 `(glyphless-char                                ((,class (:foreground ,gray-2))))
 `(header-line                                   ((,class (:background ,black-0))))
 `(highlight                                     ((,class (:background ,gray-2 :foreground ,lavender-1))))
 `(hl-line                                       ((,class (:background ,black-2))))
 `(homoglyph                                     ((,class (:foreground ,blue-2))))
 `(internal-border                               ((,class (:background ,black-1b))))
 `(line-number                                   ((,class (:foreground ,gray-2))))
 `(line-number-current-line                      ((,class (:foreground ,lavender-2 :background ,black-2 :weight bold))))
 `(lv-separator                                  ((,class (:foreground ,navy-3 :background ,black-2))))
 `(match                                         ((,class (:background ,yellow :foreground ,black-0))))
 `(menu                                          ((,class (:background ,black-0 :foreground ,white-0))))
 `(mode-line                                     ((,class (:background ,black-0 :foreground ,white-0 :weight bold))))
 `(mode-line-inactive                            ((,class (:background unspecified :foreground ,gray-2
								       :box (:line-width 1 :color ,black-2)))))
 `(mode-line-active                              ((,class (:background ,black-0 :foreground ,white-1
								       :box (:line-width 1 :color ,gray-1)))))
 `(mode-line-highlight                           ((,class (:foreground ,khaki-1))))
 `(mode-line-buffer-id                           ((,class (:foreground ,teal-2 :weight bold))))
 `(numbers                                       ((,class (:background ,pink))))
 `(region                                        ((,class (:background ,navy-2))))
 `(separator-line                                ((,class (:background ,black-0))))
 `(fill-column-indicator                         ((,class (:background ,black-1b :foreground ,black-0))))
 `(shadow                                        ((,class (:foreground ,ash-gray))))
 `(success                                       ((,class (:foreground ,teal-2))))
 `(vertical-border                               ((,class (:foreground ,gray-2))))
 `(warning                                       ((,class (:foreground ,orange))))
 `(window-border                                 ((,class (:background ,black-1b))))
 `(window-divider                                ((,class (:foreground ,black-2))))
 `(hi-yellow                                     ((,class (:background ,yellow :foreground ,black-1b))))

 ;; Font lock
 `(font-lock-type-face                           ((,class (:foreground ,teal-2))))
 `(font-lock-regexp-grouping-backslash           ((,class (:foreground ,khaki-1))))
 `(font-lock-keyword-face                        ((,class (:foreground ,purple :slant ,(if cobrakai-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-warning-face                        ((,class (:foreground ,orange))))
 `(font-lock-string-face                         ((,class (:foreground ,(if cobrakai-theme-minimal white-0 green-2) :slant italic))))
 `(font-lock-builtin-face                        ((,class (:foreground ,blue-1))))
 `(font-lock-reference-face                      ((,class (:foreground ,red-2))))
 `(font-lock-constant-face                       ((,class (:foreground ,(if cobrakai-theme-minimal white-1 yellow)))))
 `(font-lock-function-name-face                  ((,class (:foreground ,blue-0))))
 `(font-lock-variable-name-face                  ((,class (:foreground ,blue-0))))
 `(font-lock-negation-char-face                  ((,class (:foreground ,red-2))))
 `(font-lock-comment-face                        ((,class (:foreground ,ash-gray :slant ,(if cobrakai-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-comment-delimiter-face              ((,class (:foreground ,ash-gray :slant ,(if cobrakai-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-doc-face                            ((,class (:foreground ,gray-2))))
 `(font-lock-doc-markup-face                     ((,class (:foreground ,gray-2))))
 `(font-lock-preprocessor-face                   ((,class (:foreground ,khaki-1))))
 `(elisp-shorthand-font-lock-face                ((,class (:foreground ,white-0))))
 `(info-xref                                     ((,class (:foreground ,yellow))))
 `(minibuffer-prompt-end                         ((,class (:foreground ,red-0 :background ,maroon))))
 `(minibuffer-prompt                             ((,class (:foreground ,yellow :background ,olive))))
 `(epa-mark                                      ((,class (:foreground ,red-3))))
 `(dired-mark                                    ((,class (:foreground ,red-3))))
 `(trailing-whitespace                           ((,class (:background ,gray-2))))

 ;; Battery colors
 `(doom-modeline-battery-critical                ((,class (:foreground ,red-2))))
 `(doom-modeline-battery-warning                 ((,class (:foreground ,green-2))))
 `(doom-modeline-battery-charging                ((,class (:foreground ,ash-gray))))
 `(doom-modeline-battery-error                   ((,class (:foreground ,red-2))))
 `(doom-modeline-battery-normal                  ((,class (:foreground ,lavender-1))))
 `(doom-modeline-battery-full                    ((,class (:foreground ,teal-2))))

 ;; Doom visual state
 `(doom-modeline-evil-motion-state               ((,class (:foreground ,blue-2))))
 `(doom-modeline-evil-emacs-state                ((,class (:foreground ,blue-0))))
 `(doom-modeline-evil-insert-state               ((,class (:foreground ,red-2))))
 `(doom-modeline-evil-normal-state               ((,class (:foreground ,blue-2))))
 `(doom-modeline-evil-visual-state               ((,class (:foreground ,green-2))))
 `(doom-modeline-evil-replace-state              ((,class (:foreground ,orange))))
 `(doom-modeline-evil-operator-state             ((,class (:foreground ,blue-0))))


 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,teal-2))))
 `(doom-modeline-buffer-path                     ((,class (:inherit bold :foreground ,teal-2))))
 `(doom-modeline-buffer-file                     ((,class (:inherit bold :foreground ,purple))))
 `(doom-modeline-buffer-modified                 ((,class (:inherit bold :foreground ,yellow))))
 `(doom-modeline-error                           ((,class (:background ,red-2))))
 `(doom-modeline-buffer-major-mode               ((,class (:foreground ,teal-2 :weight bold))))
 `(doom-modeline-info                            ((,class (:weight bold :foreground ,blue-2))))
 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,peach))))
 `(doom-modeline-bar                             ((,class (:weight bold :background ,lavender-1))))
 `(doom-modeline-panel                           ((,class (:inherit bold :background ,khaki-2 :foreground ,black-2))))
 `(doom-themes-visual-bell                       ((,class (:background ,red-0))))

 ;; elfeed
 `(elfeed-search-feed-face                       ((,class (:foreground ,lavender-1))))
 `(elfeed-search-tag-face                        ((,class (:foreground ,teal-2))))

 ;; message colors
 `(message-header-name                           ((,class (:foreground ,gray-2))))
 `(message-header-other                          ((,class (:foreground ,peach))))
 `(message-header-subject                        ((,class (:foreground ,yellow))))
 `(message-header-to                             ((,class (:foreground ,white-1))))
 `(message-header-cc                             ((,class (:foreground ,teal-2))))
 `(message-header-xheader                        ((,class (:foreground ,white-1))))
 `(custom-link                                   ((,class (:foreground ,blue-0))))
 `(link                                          ((,class (:foreground ,blue-0))))

 ;; markdown
 `(markdown-header-face-1                       ((,class (:inherit bold :foreground ,red-2))))
 `(markdown-header-face-2                       ((,class (:inherit bold :foreground ,lavender-2))))
 `(markdown-header-face-3                       ((,class (:foreground ,khaki-1))))
 `(markdown-header-face-4                       ((,class (:foreground ,white-0))))
 `(markdown-header-face-5                       ((,class (:foreground ,white-0))))
 `(markdown-header-face-6                       ((,class (:foreground ,yellow))))

 ;; org-mode
 `(org-done                                      ((,class (:foreground ,steel))))
 `(org-code                                      ((,class (:background ,black-0
								       :foreground ,ash-gray))))
 `(org-meta-line                                 ((,class (:background ,green-0 :foreground ,green-2))))
 `(org-block                                     ((,class (:background ,navy-1 :foreground ,white-0))))
 `(org-block-begin-line                          ((,class (:background ,navy-1 :foreground ,blue-1))))
 `(org-block-end-line                            ((,class (:background ,navy-1 :foreground ,blue-1))))
 `(org-headline-done                             ((,class (:foreground ,steel :strike-through t))))
 `(org-todo                                      ((,class (:foreground ,peach :weight bold))))
 `(org-headline-todo                             ((,class (:foreground ,black-2))))
 `(org-upcoming-deadline                         ((,class (:foreground ,red-2))))
 `(org-footnote                                  ((,class (:foreground ,teal-2))))
 `(org-indent                                    ((,class (:background ,black-1b :foreground ,black-1b))))
 `(org-hide                                      ((,class (:background ,black-1b :foreground ,black-1b))))
 `(org-date                                      ((,class (:foreground ,navy-3))))
 `(org-ellipsis                                  ((,class (:foreground ,navy-3 :weight bold))))
 `(org-level-1                                   ((,class (:inherit bold :foreground ,red-2 :height ,(if cobrakai-theme-org-height 1.4 1.0) :weight ,(if cobrakai-theme-org-bold 'unspecified 'normal)))))
 `(org-level-2                                   ((,class (:inherit bold :foreground ,lavender-2 :height ,(if cobrakai-theme-org-height 1.3 1.0) :weight ,(if cobrakai-theme-org-bold 'unspecified 'normal)))))
 `(org-level-3                                   ((,class (:foreground ,khaki-1 :height ,(if cobrakai-theme-org-height 1.2 1.0)))))
 `(org-level-4                                   ((,class (:foreground ,red-2 :height ,(if cobrakai-theme-org-height 1.1 1.0)))))
 `(org-level-5                                   ((,class (:foreground ,lavender-2 :height ,(if cobrakai-theme-org-height 1.1 1.0)))))
 `(org-level-6                                   ((,class (:foreground ,khaki-1 :height ,(if cobrakai-theme-org-height 1.1 1.0)))))
 `(org-level-7                                   ((,class (:foreground ,red-2 :height ,(if cobrakai-theme-org-height 1.1 1.0)))))
 `(org-level-8                                   ((,class (:foreground ,lavender-2 :height ,(if cobrakai-theme-org-height 1.1 1.0)))))
 `(org-priority                                  ((,class (:foreground ,khaki-1 :inherit bold :weight ,(if cobrakai-theme-org-priority-bold 'unspecified 'normal)))))

 ;; imenu
 `(imenu-list-entry-face                         ((,class (:foreground ,white-0))))
 `(imenu-list-entry-face-0                       ((,class (:foreground ,red-2))))
 `(imenu-list-entry-face-1                       ((,class (:foreground ,lavender-2))))
 `(imenu-list-entry-face-2                       ((,class (:foreground ,khaki-1))))
 `(imenu-list-entry-face-3                       ((,class (:foreground ,white-0))))
 `(imenu-list-entry-subalist-face-0              ((,class (:foreground ,red-2))))
 `(imenu-list-entry-subalist-face-1              ((,class (:foreground ,lavender-2))))
 `(imenu-list-entry-subalist-face-2              ((,class (:foreground ,khaki-1))))
 `(imenu-list-entry-subalist-face-3              ((,class (:foreground ,white-0))))

 ;; which-key
 `(which-key-key-face                            ((,class (:inherit font-lock-variable-name-face))))
 `(which-func                                    ((,class (:inherit font-lock-function-name-face :weight bold))))
 `(which-key-group-description-face              ((,class (:foreground ,red-3))))
 `(which-key-command-description-face            ((,class (:foreground ,blue-0))))
 `(which-key-local-map-description-face          ((,class (:foreground ,yellow))))
 `(which-key-posframe                            ((,class (:background ,navy-2))))
 `(which-key-posframe-border                     ((,class (:background ,navy-2))))

 ;; swiper
 `(swiper-line-face                              ((,class (:foreground ,yellow))))
 `(swiper-background-match-face-1                ((,class (:background ,peach :foreground ,black-0))))
 `(swiper-background-match-face-2                ((,class (:background ,blue-0 :foreground ,black-0))))
 `(swiper-background-match-face-3                ((,class (:background ,khaki-1 :foreground ,black-0))))
 `(swiper-background-match-face-4                ((,class (:background ,red-2 :foreground ,black-0))))
 `(swiper-match-face-1                           ((,class (:inherit swiper-background-match-face-1))))
 `(swiper-match-face-2                           ((,class (:inherit swiper-background-match-face-2))))
 `(swiper-match-face-3                           ((,class (:inherit swiper-background-match-face-3))))
 `(swiper-match-face-4                           ((,class (:inherit swiper-background-match-face-4))))

 `(counsel-outline-default                       ((,class (:foreground ,yellow))))
 `(info-header-xref                              ((,class (:foreground ,yellow))))
 `(xref-file-header                              ((,class (:foreground ,yellow))))
 `(xref-match                                    ((,class (:foreground ,yellow))))

 ;; rainbow delimiters
 `(rainbow-delimiters-mismatched-face            ((,class (:foreground ,red-2))))
 `(rainbow-delimiters-unmatched-face             ((,class (:foreground ,teal-2))))
 `(rainbow-delimiters-base-error-face            ((,class (:foreground ,red-2))))
 `(rainbow-delimiters-base-face                  ((,class (:foreground ,gray-2))))

 `(rainbow-delimiters-depth-1-face               ((,class (:foreground ,lavender-2))))
 `(rainbow-delimiters-depth-2-face               ((,class (:foreground ,steel))))
 `(rainbow-delimiters-depth-3-face               ((,class (:foreground ,lavender-1))))
 `(rainbow-delimiters-depth-4-face               ((,class (:foreground ,green-2))))
 `(rainbow-delimiters-depth-5-face               ((,class (:foreground ,teal-2))))
 `(rainbow-delimiters-depth-6-face               ((,class (:foreground ,yellow))))
 `(rainbow-delimiters-depth-7-face               ((,class (:foreground ,red-3))))
 `(rainbow-delimiters-depth-8-face               ((,class (:foreground ,blue-2))))
 `(rainbow-delimiters-depth-9-face               ((,class (:foreground ,lavender-2))))

 ;; show-paren
 `(show-paren-match                              ((,class (:background ,teal-1 :foreground ,black-0 :weight bold :underline ,(when cobrakai-theme-underline-parens t)))))
 `(show-paren-match-expression                   ((,class (:background ,teal-1 :foreground ,black-0 :weight bold))))
 `(show-paren-mismatch                           ((,class (:background ,red-2 :foreground ,white-1 :underline ,(when cobrakai-theme-underline-parens t)))))
 `(tooltip                                       ((,class (:foreground ,blue-2 :background ,black-0 :weight bold))))

 ;; company-box
 `(company-tooltip                               ((,class (:background ,black-2))))
 `(company-tooltip-common                        ((,class (:foreground ,mustard))))
 `(company-tooltip-quick-access                  ((,class (:foreground ,lavender-2))))
 `(company-tooltip-scrollbar-thumb               ((,class (:background ,red-0))))
 `(company-tooltip-scrollbar-track               ((,class (:background ,black-2))))
 `(company-tooltip-search                        ((,class (:background ,yellow :foreground ,black-0 :distant-foreground ,white-0))))
 `(company-tooltip-selection                     ((,class (:background ,red-2 :foreground ,maroon :weight bold))))
 `(company-tooltip-mouse                         ((,class (:background ,black-2 :foreground ,black-0 :distant-foreground ,white-0))))
 `(company-tooltip-annotation                    ((,class (:foreground ,red-2 :distant-foreground ,black-1))))
 `(company-scrollbar-bg                          ((,class (:inherit tooltip))))
 `(company-scrollbar-fg                          ((,class (:background ,red-2))))
 `(company-preview                               ((,class (:foreground ,yellow))))
 `(company-preview-common                        ((,class (:foreground ,red-2 :weight bold))))
 `(company-preview-search                        ((,class (:inherit company-tooltip-search))))
 `(company-template-field                        ((,class (:inherit match))))

 ;; flycheck
 `(flycheck-posframe-background-face             ((,class (:background ,black-0))))
 `(flycheck-posframe-face                        ((,class (:background ,black-0))))
 `(flycheck-posframe-info-face                   ((,class (:background ,black-0 :foreground ,green-1))))
 `(flycheck-posframe-warning-face                ((,class (:background ,black-0 :foreground ,blue-2))))
 `(flycheck-posframe-error-face                  ((,class (:background ,black-0 :foreground ,red-1))))
 `(flycheck-fringe-warning                       ((,class (:foreground ,blue-2))))
 `(flycheck-fringe-error                         ((,class (:foreground ,red-1))))
 `(flycheck-fringe-info                          ((,class (:foreground ,green-1))))
 `(flycheck-error-list-warning                   ((,class (:foreground ,orange :weight bold))))
 `(flycheck-error-list-error                     ((,class (:foreground ,red-1 :weight bold))))
 `(flycheck-error-list-info                      ((,class (:foreground ,teal-1 :weight bold))))
 `(flycheck-inline-error                         ((,class (:foreground ,red-1 :background ,maroon :slant italic :weight bold :height 138))))
 `(flycheck-inline-info                          ((,class (:foreground ,blue-2 :background ,navy-1 :slant italic  :weight bold :height 138))))
 `(flycheck-inline-warning                       ((,class (:foreground ,olive :background ,yellow :slant italic :weight bold :height 138))))

 ;; indent dots
 `(highlight-indent-guides-character-face        ((,class (:foreground ,gray-1))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,gray-1))))
 `(highlight-indent-guides-stack-odd-face        ((,class (:foreground ,gray-1))))
 `(highlight-indent-guides-stack-even-face       ((,class (:foreground ,gray-2))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,gray-1))))
 `(highlight-indent-guides-even-face             ((,class (:foreground ,black-2))))
 `(highlight-indent-guides-odd-face              ((,class (:foreground ,gray-2))))


 `(highlight-operators-face                      ((,class (:foreground ,khaki-2))))
 `(highlight-quoted-symbol                       ((,class (:foreground ,green-2))))
 `(highlight-numbers-face                        ((,class (:foreground ,pink))))
 `(highlight-symbol-face                         ((,class (:background ,navy-2 :foreground ,blue-2))))

 ;; ivy
 `(ivy-current-match                             ((,class (:background ,blue-0 :foreground ,black-0 :weight bold))))
 `(ivy-action                                    ((,class (:background unspecified :foreground ,white-0))))
 `(ivy-grep-line-number                          ((,class (:background unspecified :foreground ,green-2))))
 `(ivy-minibuffer-match-face-1                   ((,class (:background unspecified :foreground ,red-3))))
 `(ivy-minibuffer-match-face-2                   ((,class (:background unspecified :foreground ,green-2))))
 `(ivy-minibuffer-match-highlight                ((,class (:foreground ,blue-2))))
 `(ivy-grep-info                                 ((,class (:foreground ,blue-2))))
 `(ivy-grep-line-number                          ((,class (:foreground ,lavender-2))))
 `(ivy-confirm-face                              ((,class (:foreground ,teal-2))))

 ;; posframe's
 `(ivy-posframe                                  ((,class (:background ,black-2))))
 `(ivy-posframe-border                           ((,class (:background ,gray-1))))

 ;;treemacs
 `(treemacs-directory-collapsed-face             ((,class (:foreground ,white-0))))
 `(treemacs-directory-face                       ((,class (:foreground ,white-0))))

 `(treemacs-file-face                            ((,class (:foreground ,white-0))))

 `(treemacs-git-added-face                       ((,class (:foreground ,peach))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,white-0))))
 `(treemacs-git-ignored-face                     ((,class (:foreground ,gray-2))))
 `(treemacs-git-unmodified-face                  ((,class (:foreground ,white-0))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,white-0))))
 `(treemacs-git-modified-face                    ((,class (:foreground ,green-2))))

 ;;lsp
 `(lsp-ui-doc-background                         ((,class (:background ,black-0 :foreground ,red-2))))
 `(lsp-ui-doc-header                             ((,class (:background ,black-0 :foreground ,red-2))))
 `(lsp-ui-doc-border                             ((,class (:background unspecified :foreground unspecified))))
 `(lsp-ui-peek-filename                          ((,class (:foreground ,blue-2))))
 `(lsp-ui-sideline-code-action                   ((,class (:foreground ,yellow))))
 `(lsp-ui-sideline-current-symbol                ((,class (:foreground ,blue-1))))
 `(lsp-ui-sideline-symbol                        ((,class (:foreground ,steel))))

 `(lsp-headerline-breadcrumb-path-error-face     ((,class (:underline (:color ,green-2 :style wave) :foreground ,gray-2 :background ,black-0))))
 `(lsp-headerline-breadcrumb-path-face           ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-path-hint-face      ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-path-info-face      ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-separator-face      ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-symbols-face        ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((,class (:background ,black-0))))
 `(lsp-headerline-breadcrumb-symbols-error-face  ((,class (:foreground ,red-2))))

 ;; Eglot
 `(eglot-diagnostic-tag-unnecessary-face         ((,class (:background ,black-0 :foreground ,ash-gray))))


 ;; dashboard
 `(dashboard-heading                             ((,class (:foreground ,lavender-2 :weight bold))))
 `(dashboard-items-face                          ((,class (:bold unspecified :foreground ,white-0))))
 `(dashboard-banner-logo-title                   ((,class (:weight bold :height 200))))
 `(dashboard-no-items-face                       ((,class (:foreground ,gray-2))))

 ;; all-the-icons
 `(all-the-icons-dgreen                          ((,class (:foreground ,teal-2))))
 `(all-the-icons-green                           ((,class (:foreground ,teal-2))))
 `(all-the-icons-dpurple                         ((,class (:foreground ,lavender-2))))
 `(all-the-icons-purple                          ((,class (:foreground ,lavender-2))))

 ;; evil
 `(evil-ex-lazy-highlight                        ((,class (:foreground ,green-0 :background ,green-1 :weight bold))))
 `(evil-ex-substitute-matches                    ((,class (:foreground ,maroon :background ,red-0 :weight bold))))
 `(evil-ex-substitute-replacement                ((,class (:foreground ,peach :strike-through unspecified :inherit evil-ex-substitute-matches))))
 `(evil-search-highlight-persist-highlight-face  ((,class (:background ,yellow))))

 ;; term
 `(term                                          ((,class (:background ,black-0 :foreground ,white-0))))
 `(term-color-blue                               ((,class (:background ,blue-0 :foreground ,blue-0))))
 `(term-color-bright-blue                        ((,class (:inherit term-color-blue))))
 `(term-color-green                              ((,class (:background ,teal-2 :foreground ,teal-2))))
 `(term-color-bright-green                       ((,class (:inherit term-color-green))))
 `(term-color-black                              ((,class (:background ,black-0 :foreground ,white-0))))
 ;; NOTE - has effect on vterm as well so vterm specific settings bellow doesn't do much.
 `(term-color-bright-black                       ((,class (:background ,black-1b :foreground ,ash-gray))))
 `(term-color-white                              ((,class (:background ,white-0 :foreground ,white-0))))
 `(term-color-bright-white                       ((,class (:background ,white-1 :foreground ,white-1))))
 `(term-color-red                                ((,class (:background ,red-2 :foreground ,red-2))))
 `(term-color-red                         ((,class (:background ,green-2 :foreground ,green-2))))
 `(term-color-yellow                             ((,class (:background ,yellow :foreground ,yellow))))
 `(term-color-bright-yellow                      ((,class (:background ,yellow :foreground ,yellow))))
 `(term-color-cyan                               ((,class (:background ,blue-1 :foreground ,blue-1))))
 `(term-color-bright-cyan                        ((,class (:background ,blue-1 :foreground ,blue-1))))
 `(term-color-magenta                            ((,class (:background ,lavender-2 :foreground ,lavender-2))))
 `(term-color-bright-magenta                     ((,class (:background ,lavender-2 :foreground ,lavender-2))))
 ;; vterm
 `(vterm-color-black                             ((,class (:background ,black-0 :foreground ,lavender-2))))
 `(vterm-color-underline                         ((,class (:foreground ,white-0))))
 `(vterm-color-inverse-video                     ((,class (:background ,black-0 :inverse-video t))))

 ;; popup
 `(popup-face                                    ((,class (:inherit tooltip))))
 `(popup-selection-face                          ((,class (:inherit tooltip))))
 `(popup-tip-face                                ((,class (:inherit tooltip))))

 ;; anzu
 `(anzu-match-1                                  ((,class (:foreground ,teal-2 :background ,black-2))))
 `(anzu-match-2                                  ((,class (:foreground ,yellow :background ,black-2))))
 `(anzu-match-3                                  ((,class (:foreground ,blue-2 :background ,black-2))))

 `(anzu-mode-line                                ((,class (:foreground ,black-0 :background ,lavender-2))))
 `(anzu-mode-no-match                            ((,class (:foreground ,white-0 :background ,red-2))))
 `(anzu-replace-to                               ((,class (:foreground ,blue-1 :background ,navy-1))))
 `(anzu-replace-highlight                        ((,class (:foreground ,red-2 :background ,maroon :strike-through t))))

 ;; ace
 `(ace-jump-face-background                      ((,class (:foreground ,navy-3))))
 `(ace-jump-face-foreground                      ((,class (:foreground ,red-2 :background ,black-0 :weight bold))))

 ;; vertico
 `(vertico-multiline                             ((,class (:background ,red-1))))
 `(vertico-group-title                           ((,class (:background ,navy-1 :foreground ,blue-2 :weight bold))))
 `(vertico-group-separator                       ((,class (:background ,navy-1 :foreground ,blue-2 :strike-through t))))
 `(vertico-current                               ((,class (:foreground ,yellow :weight bold :slant italic :background ,navy-2))))

 `(vertico-posframe-border                       ((,class (:background ,gray-1))))
 `(vertico-posframe                              ((,class (:background ,black-2))))
 `(orderless-match-face-0                        ((,class (:foreground ,blue-0 :weight bold))))

 `(comint-highlight-prompt                       ((,class (:background ,lavender-2 :foreground ,black-1))))
 `(completions-annotations                       ((,class (:background unspecified :foreground ,steel :slant italic))))
 `(marginalia-file-priv-no                       ((,class (:background unspecified))))

  ;; hydra
 `(hydra-face-amaranth                           ((,class (:foreground ,red-0))))
 `(hydra-face-blue                               ((,class (:foreground ,blue-1))))
 `(hydra-face-pink                               ((,class (:foreground ,pink))))
 `(hydra-face-red                                ((,class (:foreground ,red-2))))
 `(hydra-face-teal                               ((,class (:foreground ,blue-2))))

 ;; tab-bar
 `(tab-bar                                       ((,class (:background ,black-0))))
 `(tab-bar-tab                                   ((,class (:background ,black-1b :foreground ,white-0))))
 `(tab-bar-tab-inactive                          ((,class (:background ,black-0 :foreground ,gray-2 :height 0.8))))

 ;; centaur-tabs
 `(centaur-tabs-active-bar-face                  ((,class (:background ,blue-1 :foreground ,white-0))))
 `(centaur-tabs-selected                         ((,class (:background ,black-1b :foreground ,white-0 :weight bold))))
 `(centaur-tabs-selected-modified                ((,class (:background ,black-1b :foreground ,white-0))))
 `(centaur-tabs-modified-marker-selected         ((,class (:background ,black-1b :foreground ,mustard))))
 `(centaur-tabs-close-selected                   ((,class (:inherit centaur-tabs-selected))))
 `(tab-line                                      ((,class (:background ,black-0))))

 `(centaur-tabs-unselected                       ((,class (:background ,black-0 :foreground ,gray-2))))
 `(centaur-tabs-default                          ((,class (:background ,black-0 :foreground ,gray-2))))
 `(centaur-tabs-unselected-modified              ((,class (:background ,black-0 :foreground ,red-2))))
 `(centaur-tabs-modified-marker-unselected       ((,class (:background ,black-0 :foreground ,gray-2))))
 `(centaur-tabs-close-unselected                 ((,class (:background ,black-0 :foreground ,gray-2))))

 `(centaur-tabs-close-mouse-face                 ((,class (:background unspecified :foreground ,red-2))))
 `(centaur-tabs-default                          ((,class (:background ,orange ))))
 `(centaur-tabs-name-mouse-face                  ((,class (:foreground ,blue-1 :weight bold))))

 `(git-gutter:added                              ((,class (:foreground ,green-1))))
 `(git-gutter:deleted                            ((,class (:foreground ,red-3))))
 `(git-gutter:modified                           ((,class (:foreground ,blue-1))))

 ;; diff-hl
 `(diff-hl-change                               ((,class (:foreground ,blue-1 :background ,navy-1))))
 `(diff-hl-delete                               ((,class (:foreground ,red-2 :background ,maroon))))
 `(diff-hl-insert                               ((,class (:foreground ,gray-2 :background ,navy-1))))

 `(diff-hl-margin-change                         ((,class (:foreground ,blue-1 :background ,navy-1))))
 `(diff-hl-margin-delete                         ((,class (:foreground ,red-2 :background ,maroon))))
 `(diff-hl-margin-insert                         ((,class (:foreground ,gray-2 :background ,navy-1))))



 `(bm-fringe-face                                ((,class (:background ,red-2 :foreground ,gray-1))))
 `(bm-fringe-persistent-face                     ((,class (:background ,red-2 :foreground ,gray-1))))

 `(ansi-color-green                              ((,class (:foreground ,green-2))))
 `(ansi-color-black                              ((,class (:background ,black-0))))
 `(ansi-color-cyan                               ((,class (:foreground ,teal-2))))
 `(ansi-color-magenta                            ((,class (:foreground ,pink))))
 `(ansi-color-blue                               ((,class (:foreground ,blue-0))))
 `(ansi-color-red                                ((,class (:foreground ,red-2))))
 `(ansi-color-white                              ((,class (:foreground ,white-0))))
 `(ansi-color-yellow                             ((,class (:foreground ,mustard))))
 `(ansi-color-bright-white                       ((,class (:foreground ,white-1))))
 `(ansi-color-bright-white                       ((,class (:foreground ,white-1))))

 `(tree-sitter-hl-face:attribute                 ((,class (:foreground ,peach))))
 `(tree-sitter-hl-face:escape                    ((,class (:foreground ,red-3))))
 `(tree-sitter-hl-face:constructor               ((,class (:foreground ,red-3 :weight semi-bold))))

 `(tree-sitter-hl-face:constant                  ((,class (:foreground ,peach))))
 `(tree-sitter-hl-face:constant.builtin          ((,class (:foreground ,yellow :weight semi-bold))))

 `(tree-sitter-hl-face:embedded                  ((,class (:foreground ,khaki-2))))


 `(tree-sitter-hl-face:function.builtin          ((,class (:foreground ,red-2 :slant italic :background ,maroon))))
 `(tree-sitter-hl-face:function.call             ((,class (:foreground ,lavender-2))))
 `(tree-sitter-hl-face:function.macro            ((,class (:foreground ,red-1))))
 `(tree-sitter-hl-face:function.special          ((,class (:foreground ,pink))))
 `(tree-sitter-hl-face:function.label            ((,class (:foreground ,peach))))

 `(tree-sitter-hl-face:method                    ((,class (:foreground ,blue-2))))
 `(tree-sitter-hl-face:method.call               ((,class (:foreground ,blue-2))))

 `(tree-sitter-hl-face:property                  ((,class (:foreground ,yellow))))
 `(tree-sitter-hl-face:property.definition       ((,class (:foreground ,white-1 :slant italic))))

 `(tree-sitter-hl-face:tag                       ((,class (:foreground ,red-2))))

 `(tree-sitter-hl-face:type                      ((,class (:foreground ,teal-2 :weight semi-bold))))
 `(tree-sitter-hl-face:type.argument             ((,class (:foreground ,peach))))
 `(tree-sitter-hl-face:type.builtin              ((,class (:foreground ,red-0))))
 `(tree-sitter-hl-face:type.parameter            ((,class (:foreground ,peach))))
 `(tree-sitter-hl-face:type.super                ((,class (:foreground ,red-1 :weight bold))))

 `(tree-sitter-hl-face:variable                  ((,class (:foreground ,blue-1 :slant italic))))
 `(tree-sitter-hl-face:variable.builtin          ((,class (:foreground ,red-3))))
 `(tree-sitter-hl-face:variable.parameter        ((,class (:foreground ,lavender-2 :slant italic))))
 `(tree-sitter-hl-face:variable.special          ((,class (:foreground ,peach))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,blue-2))))

 `(tree-sitter-hl-face:number                    ((,class (:foreground ,pink))))
 `(tree-sitter-hl-face:operator                  ((,class (:foreground ,pink :weight bold))))

 `(tree-sitter-hl-face:punctuation               ((,class (:foreground ,blue-2))))
 `(tree-sitter-hl-face:punctuation.bracket       ((,class (:foreground ,lavender-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.delimiter     ((,class (:foreground ,lavender-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.special       ((,class (:foreground ,red-2))))

 `(tree-sitter-hl-face:case-pattern              ((,class (:foreground ,red-3))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,red-3))))
 `(tree-sitter-hl-face:keyword.compiler          ((,class (:foreground ,red-2 :slant italic))))

 `(focus-unfocused                               ((,class (:foreground ,gray-2)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'cobrakai)
;;; cobrakai-theme.el ends here
