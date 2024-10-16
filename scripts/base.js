function change_visibility(class_name) {
    var target_objs = document.querySelectorAll('.' + class_name);

    for(var i=0; i<target_objs.length; i++){
        if(target_objs[i].style.visibility != 'hidden') {
            target_objs[i].style.visibility = 'hidden';
            target_objs[i].style.display = 'none';
        } else {
            target_objs[i].style.visibility = 'visible'; 
            target_objs[i].style.display = ''; 
        } 
    }
}