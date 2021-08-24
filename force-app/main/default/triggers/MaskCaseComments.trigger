trigger MaskCaseComments on CaseComment (before insert, before update) {
    for(CaseComment cc : trigger.new) {
    if (cc.CommentBody != null) 
        cc.CommentBody = StringUtils.MaskString(cc.CommentBody, new list<string>{'4\\d{3}[- ]*\\d{4}[- ]*\\d{4}[- ]*\\d{4}'}, '*', 4);
    }
}