module NotesHelper
  def bookmarklet
    "javascript:var%20d=document,w=window,e=w.getSelection,k=d.getSelection,x=d.selection,s=(e?e():(k)?k():(x?x.createRange().text:0)),f='#{share_notes_url}',l=d.location,e=encodeURIComponent,p='?v=3&u='+e(l.href)%20+'&t='+e(d.title)%20+'&s='+e(s),u=f+p;try{if(!/^(.*\.)?.[^.]*$/.test(l.host))throw(0);tstbklt();}catch(z){a%20=function(){if(!w.open(u,'t','toolbar=0,resizable=0,status=1,width=510,height=630'))l.href=u;};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();}void(0)"
  end
end
