# Spreadhead Initializer
#
# In this file you can do any kind of initialization you need but it is mainly
# for controlling which users get access to create, edit, destroy and update
# pages. By default, any user can modify the pages. If only logged in users can 
# do this, while everyone else can view the  pages then you can add a before 
# filter. If you are using a toolkit like Clearance, then you can use the 
# following:
#
# Spreadhead::PagesController.before_filter :redirect_to_root, 
#                                           :except => [:show], 
#                                           :unless => :signed_in?
