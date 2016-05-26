/**
 * @author `user-full-name` (`user-mail-address`)
 * @date `(format-time-string "%Y-%m-%d")`
 */
package ${1:`(mapconcat 'identity (split-string (replace-regexp-in-string ".*src\\(/\\(main\\|test\\)\\)?\\(/java\\)?" "" default-directory) "/" t) ".")`};

public class ${1:`(file-name-sans-extension (buffer-name))`}$2 {
    $0
}
