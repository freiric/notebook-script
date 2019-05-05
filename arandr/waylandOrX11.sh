echo "usgin lginctkl"
loginctl show-session $(loginctl show-user fb019397 -pSessions --value) -p Type --value
echo "using \$XDG_SESSION_TYPE"
echo $XDG_SESSION_TYPE
