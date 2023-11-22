// // Les actifs du script ont changé pour v2.3.0 Voir
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function rect_contains(rect, point){return point.x>rect.x&&point.x<rect.x+rect.w && point.y>rect.y&&point.y<rect.y+rect.h;}
function mouse_getpos(){return {x:mouse_x,y:mouse_y};}
function rect_contains_mouse(rect){return rect_contains(rect, mouse_getpos());}
