
(require 'restclient)



(defun insert-doc ()
  (insert "
C-c C-c: runs the query under the cursor, tries to pretty-print the response (if possible)
C-c C-r: same, but doesn't do anything with the response, just shows the buffer
C-c C-v: same as C-c C-c, but doesn't switch focus to other window
C-c C-p: jump to the previous query
C-c C-n: jump to the next query
C-c C-.: mark the query under the cursor
C-c C-u: copy query under the cursor as a curl command
C-c C-g: start a helm session with sources for variables and requests (if helm is available, of course)




# -*- restclient -*-
#
# Gets  all Github APIs, formats JSON, shows response status and headers underneath.
# Also sends a User-Agent header, because the Github API requires this.
#
GET https://api.github.com
User-Agent: Emacs Restclient

#
# XML is supported - highlight, pretty-print
#
GET http://www.redmine.org/issues.xml?limit=10

#
# It can even show an image!
#
GET http://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png
#
# A bit of json GET, you can pass headers too
#
GET http://jira.atlassian.com/rest/api/latest/issue/JRA-9
User-Agent: Emacs24
Accept-Encoding: compress, gzip

#
# Post works too, entity just goes after an empty line. Same is for PUT.
#
POST https://jira.atlassian.com/rest/api/2/search
Content-Type: application/json

{
        \"jql\": \"project = HSP\",
        \"startAt\": 0,
        \"maxResults\": 15,
        \"fields\": [
                \"summary\",
                \"status\",
                \"assignee\"
        ]
}
#
# And delete, will return not-found error...
#
DELETE https://jira.atlassian.com/rest/api/2/version/20"))


(add-hook 'restclient-mode-hook 'insert-doc)

(provide 'setup-restclient)
