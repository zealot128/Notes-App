/*
 * RailsAdmin remote form @VERSION
 *
 * License
 *
 * http://www.railsadmin.org
 *
 * Depends:
 *   jquery.ui.core.js
 *   jquery.ui.widget.js
 *   jquery.ui.dialog.js
 */
(function(a){a.widget("ra.remoteForm",{dialog:null,options:{dialogClass:"",height:600,width:720},_create:function(){var b=this,c=a(this.element).siblings("select").data("edit-url");typeof c!="undefined"&&c.length&&a("#"+this.element.parent().attr("id")+" .input.ra-multiselect option").live("dblclick",function(d){d.preventDefault();var e=b._getDialog();a.ajax({url:c.replace("__ID__",this.value),beforeSend:function(a){a.setRequestHeader("Accept","text/javascript")},success:function(a,c,d){e.html(a),b._bindFormEvents()},error:function(a,b,c){e.html(a.responseText)},dataType:"text"})}),a(b.element).bind("click",function(c){c.preventDefault();var d=b._getDialog();a.ajax({url:a(this).attr("href"),beforeSend:function(a){a.setRequestHeader("Accept","text/javascript")},success:function(a,c,e){d.html(a),b._bindFormEvents()},error:function(a,b,c){d.html(a.responseText)},dataType:"text"})})},_bindFormEvents:function(){var b=this._getDialog(),c=b.find("form"),d=this,e=b.find(":submit[name=_save]").text(),f=b.find(":submit[name=_continue]").text();b.find("div.control").hide(),b.dialog("option","title",a("h2.title",b).remove().text()),c.attr("data-remote",!0),b.find(":submit").remove(),b.find(".ra-block-content").removeClass("ra-block-content");var g={};e&&(g[e]=function(){if(typeof CKEDITOR!="undefined")for(instance in CKEDITOR.instances)CKEDITOR.instances[instance].updateElement();b.find("form").submit()}),f&&(g[f]=function(){b.dialog("close")}),b.dialog("option","buttons",g),0==a("form > .navform :submit",b).length&&a("form > .navform",b).remove(),c.bind("ajax:success",function(c,e,f,g){var h=a.parseJSON(e),i=d.element.siblings("select"),j=d.element.siblings(".ra-filtering-select-input"),k='<option value="'+h.id+'" selected>'+h.label+"</option>";if(d.element.siblings("button").length)j.length>0&&(j[0].value=h.label),i.length>0&&(i.html(k),i[0].value=h.id);else{var l=d.element.siblings(".input.ra-multiselect");i.find("option[value="+h.id+"]").length?(i.find("option[value="+h.id+"]").text(h.label),l.find("option[value= "+h.id+"]").text(h.label)):(i.prepend(k),l.find("select.ra-multiselect-selection").prepend(k))}b.dialog("close")}),c.bind("ajax:error",function(a,c,e,f){b.html(c.responseText),d._bindFormEvents()})},_getDialog:function(){if(!this.dialog){var b=this;this.dialog=a('<div class="'+this.options.dialogClass+'"></div>').dialog({autoShow:!1,close:function(c,d){a(this).dialog("destroy"),a(this).remove(),b.dialog=null},modal:!0,width:this.options.width,height:this.options.height})}return this.dialog}})})(jQuery)