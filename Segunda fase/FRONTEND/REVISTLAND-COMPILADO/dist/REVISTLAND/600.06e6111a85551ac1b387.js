"use strict";(self.webpackChunkrevistland=self.webpackChunkrevistland||[]).push([[600],{614:(p,h,i)=>{i.d(h,{i:()=>r});var n=i(3342),d=i(7716),s=i(1841);let r=(()=>{class t{constructor(m){this.http=m,this.baseUrl="http://localhost:8080/REVISTLAND/controladorAutenticacion"}getUsuarioAutenticado(){return this._usuario||(this._usuario=JSON.parse(localStorage.getItem("autenticado"))||void 0),this._usuario}agregarNuevoUsuario(m){return this.http.post(`${this.baseUrl}?accion=crear`,m).pipe((0,n.b)(f=>{console.log(f),this._usuario=f,localStorage.clear(),localStorage.setItem("autenticado",JSON.stringify(this._usuario))}))}autenticarUsuario(m){return this.http.post(`${this.baseUrl}?accion=autenticar`,m).pipe((0,n.b)(f=>{console.log(f),this._usuario=f,localStorage.clear(),localStorage.setItem("autenticado",JSON.stringify(this._usuario))}))}verificarTienePerfil(m){return this.http.get(`${this.baseUrl}?accion=verificarTienePerfil&nombre=${m}`)}}return t.\u0275fac=function(m){return new(m||t)(d.LFG(s.eN))},t.\u0275prov=d.Yz7({token:t,factory:t.\u0275fac,providedIn:"root"}),t})()},2839:(p,h,i)=>{i.d(h,{s:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorFechaGlobal"}obtenerFecha(){return this.http.get(`${this.baseUrl}?accion=obtenerFecha`)}cambiarFecha(e){return this.http.post(`${this.baseUrl}?accion=cambiarFecha`,e)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},1068:(p,h,i)=>{i.d(h,{k:()=>J});var n=i(3679);class d{constructor(c,a,o,_,u,g,v){this._nombreUsuario=c,this._descripcion=a,this._hobbies=o,this._gustos=_,this._categorias=u,this._etiquetas=g,this._foto=v}get nombreUsuario(){return this._nombreUsuario}set nombreUsuario(c){this._nombreUsuario=c}get foto(){return this._foto}set foto(c){this._foto=c}get etiquetas(){return this._etiquetas}set etiquetas(c){this._etiquetas=c}get categorias(){return this._categorias}set categorias(c){this._categorias=c}get gustos(){return this._gustos}set gustos(c){this._gustos=c}get hobbies(){return this._hobbies}set hobbies(c){this._hobbies=c}get descripcion(){return this._descripcion}set descripcion(c){this._descripcion=c}}var s=i(3948),r=i(6461),t=i(7716),e=i(614),m=i(4655),f=i(9947),b=i(3738),T=i(8295),M=i(9983),A=i(8583),I=i(7441),Z=i(8341),q=i(1095),S=i(2458),D=i(6627);function x(l,c){1&l&&(t.TgZ(0,"div",35),t._uU(1," Almenos selecciona una categoria "),t.qZA())}function R(l,c){if(1&l){const a=t.EpF();t.TgZ(0,"mat-option",36),t.NdJ("click",function(){const u=t.CHM(a).$implicit;return t.oxw().agregarCategoria(u)}),t._uU(1),t.ALo(2,"titlecase"),t.qZA()}if(2&l){const a=c.$implicit;t.Q6J("value",a),t.xp6(1),t.hij(" ",t.lcZ(2,2,a)," ")}}function F(l,c){if(1&l){const a=t.EpF();t.TgZ(0,"mat-chip",37),t._uU(1),t.ALo(2,"titlecase"),t.TgZ(3,"button",38),t.TgZ(4,"mat-icon",39),t.NdJ("click",function(){const u=t.CHM(a).$implicit;return t.oxw().cancelarCategoria(u)}),t._uU(5,"cancel"),t.qZA(),t.qZA(),t.qZA()}if(2&l){const a=c.$implicit;t.xp6(1),t.hij(" ",t.lcZ(2,1,a)," ")}}function y(l,c){1&l&&(t.TgZ(0,"div",35),t._uU(1," Almenos selecciona una etiqueta "),t.qZA())}function L(l,c){if(1&l){const a=t.EpF();t.TgZ(0,"mat-option",36),t.NdJ("click",function(){const u=t.CHM(a).$implicit;return t.oxw().agregarEtiqueta(u)}),t._uU(1),t.ALo(2,"titlecase"),t.qZA()}if(2&l){const a=c.$implicit;t.Q6J("value",a),t.xp6(1),t.hij(" ",t.lcZ(2,2,a)," ")}}function $(l,c){1&l&&(t.TgZ(0,"button",38),t.TgZ(1,"mat-icon"),t._uU(2,"cancel"),t.qZA(),t.qZA())}function N(l,c){if(1&l){const a=t.EpF();t.TgZ(0,"mat-chip",40),t.NdJ("removed",function(){const u=t.CHM(a).$implicit;return t.oxw().remove(u)}),t._uU(1),t.ALo(2,"titlecase"),t.YNc(3,$,3,0,"button",41),t.qZA()}if(2&l){const a=c.$implicit,o=t.oxw();t.Q6J("selectable",o.selectable)("removable",o.removable),t.xp6(1),t.hij(" ",t.lcZ(2,4,a)," "),t.xp6(2),t.Q6J("ngIf",o.removable)}}let J=(()=>{class l{constructor(a,o,_,u){var g,v,P;this.fb=a,this.usuarioService=o,this.router=_,this.perfilService=u,this.foto=new s.j("",""),this.hayEtiquetas=!0,this.hayCategorias=!0,this.formularioPerfil=this.fb.group({descripcion:[`${(null===(g=this.perfil)||void 0===g?void 0:g.descripcion)||""} `,[n.kI.required,n.kI.minLength(5)]],hobbies:[`${(null===(v=this.perfil)||void 0===v?void 0:v.hobbies)||""}`,[n.kI.required,n.kI.minLength(5)]],gustos:[`${(null===(P=this.perfil)||void 0===P?void 0:P.gustos)||""}`,[n.kI.required]]}),this.allCategorias=[],this.allEtiquetas=[],this.categorias=[],this.etiquetas=[],this.selectable=!0,this.removable=!0,this.addOnBlur=!0,this.separatorKeysCodes=[r.K5,r.OC],this.perfilService.obtenerCategorias().subscribe(C=>this.allCategorias=C),this.perfilService.obtenerEtiquetas().subscribe(C=>this.allEtiquetas=C)}ngOnInit(){var a;this.usuario=this.usuarioService.getUsuarioAutenticado(),this.perfilService.obtenerPerfil(null===(a=this.usuario)||void 0===a?void 0:a.nombre).subscribe(o=>{var _,u;o&&(this.perfil=o,this.foto.contenido=o.foto.contenido,this.formularioPerfil.controls.descripcion.setValue(o.descripcion),this.formularioPerfil.controls.hobbies.setValue(o.hobbies),this.formularioPerfil.controls.gustos.setValue(o.gustos),this.perfilService.obtenerEtiquetasUsuario(null===(_=this.usuario)||void 0===_?void 0:_.nombre).subscribe(g=>this.etiquetas=g),this.perfilService.obtenerCategoriasUsuario(null===(u=this.usuario)||void 0===u?void 0:u.nombre).subscribe(g=>this.categorias=g))})}cancelarCategoria(a){let o=this.categorias.indexOf(a);this.categorias.splice(o,1)}agregarCategoria(a){this.categorias.includes(a.toUpperCase())||(this.hayCategorias=!0,this.categorias.push(a.toUpperCase()))}guardarPerfil(){var a,o,_,u;if(this.formularioPerfil.invalid)return void this.formularioPerfil.markAllAsTouched();const g=null===(a=this.usuario)||void 0===a?void 0:a.nombre,v=null===(o=this.formularioPerfil.get("descripcion"))||void 0===o?void 0:o.value,P=null===(_=this.formularioPerfil.get("hobbies"))||void 0===_?void 0:_.value,C=null===(u=this.formularioPerfil.get("gustos"))||void 0===u?void 0:u.value,E=this.categorias,O=this.etiquetas,B=this.foto;if(0===E.length)return void(this.hayCategorias=!1);if(0===O.length)return void(this.hayEtiquetas=!1);const K=new d(g,v,P,C,E,O,B);this.perfilService.agregarPerfil(K).subscribe(W=>{var U;switch(null===(U=this.usuario)||void 0===U?void 0:U.idTipoCuenta){case 1:this.router.navigate(["./editor/publicar"]);break;case 3:this.router.navigate(["./usuario/inicio"]);break;default:this.router.navigate(["./autenticacion/login"])}})}add(a){const o=(a.value||"").trim();o&&!this.etiquetas.includes(o.toUpperCase())&&(this.hayEtiquetas=!0,this.etiquetas.push(o.toUpperCase())),a.chipInput.clear()}agregarEtiqueta(a){const o=a.trim();o&&!this.etiquetas.includes(o.toUpperCase())&&(this.hayEtiquetas=!0,this.etiquetas.push(o.toUpperCase()))}remove(a){const o=this.etiquetas.indexOf(a);o>=0&&this.etiquetas.splice(o,1)}onPhotoSelected(a){if(a.target.files&&a.target.files[0]){this.archivo=a.target.files[0],this.foto.nombre=this.archivo.name;const o=new FileReader;o.readAsDataURL(this.archivo),o.onload=_=>this.foto.contenido=o.result}}}return l.\u0275fac=function(a){return new(a||l)(t.Y36(n.qu),t.Y36(e.i),t.Y36(m.F0),t.Y36(f.F))},l.\u0275cmp=t.Xpm({type:l,selectors:[["app-perfil"]],decls:70,vars:12,consts:[[1,"fondo"],[1,"tamano","redondear"],["id","header",1,"centrar"],[1,"titulo"],["id","contenido"],["autocomplete","off",3,"formGroup","ngSubmit"],["id","izquierda"],["type","file",1,"invisible",3,"change"],["photoInput",""],[1,"imagen",3,"src","click"],[1,"nombre-usuario"],["id","derecha"],["id","descripcion"],[1,"text-area"],[1,"subtitulo"],["appearance","outline",1,"full-width"],["formControlName","descripcion","matInput",""],["formControlName","hobbies","matInput",""],["formControlName","gustos","matInput",""],["id","vacio"],["id","preferencias"],["id","titulo-pref"],["id","categorias"],["class","form-text text-danger",4,"ngIf"],["appearance","outline"],[3,"value","click",4,"ngFor","ngForOf"],["color","accent","selected","",4,"ngFor","ngForOf"],["id","etiquetas"],["aria-label","Fruit selection"],["chipList",""],["color","warn","selected","",3,"selectable","removable","removed",4,"ngFor","ngForOf"],["placeholder","Agregar nueva etiqueta",3,"matChipInputFor","matChipInputSeparatorKeyCodes","matChipInputAddOnBlur","matChipInputTokenEnd"],["id","footer"],[1,"mat-action"],["mat-raised-button","","color","primary",1,"boton"],[1,"form-text","text-danger"],[3,"value","click"],["color","accent","selected",""],["matChipRemove",""],[3,"click"],["color","warn","selected","",3,"selectable","removable","removed"],["matChipRemove","",4,"ngIf"]],template:function(a,o){if(1&a){const _=t.EpF();t.TgZ(0,"div",0),t.TgZ(1,"mat-card",1),t.TgZ(2,"mat-card-header",2),t.TgZ(3,"h1",3),t._uU(4,"PERFIL"),t.qZA(),t.qZA(),t.TgZ(5,"mat-card-content",4),t.TgZ(6,"form",5),t.NdJ("ngSubmit",function(){return o.guardarPerfil()}),t.TgZ(7,"div",6),t.TgZ(8,"div"),t.TgZ(9,"input",7,8),t.NdJ("change",function(g){return o.onPhotoSelected(g)}),t.qZA(),t.TgZ(11,"img",9),t.NdJ("click",function(){return t.CHM(_),t.MAs(10).click()}),t.qZA(),t.qZA(),t.TgZ(12,"div",10),t._uU(13),t.qZA(),t.qZA(),t.TgZ(14,"div",11),t.TgZ(15,"div",12),t.TgZ(16,"div",13),t.TgZ(17,"div",14),t._uU(18,"Descripcion"),t.qZA(),t.TgZ(19,"mat-form-field",15),t._UZ(20,"textarea",16),t.qZA(),t.qZA(),t._UZ(21,"br"),t.TgZ(22,"div",13),t.TgZ(23,"div",14),t._uU(24,"Hobbies"),t.qZA(),t.TgZ(25,"mat-form-field",15),t._UZ(26,"textarea",17),t.qZA(),t.qZA(),t._UZ(27,"br"),t.TgZ(28,"div",13),t.TgZ(29,"div",14),t._uU(30,"Gustos"),t.qZA(),t.TgZ(31,"mat-form-field",15),t._UZ(32,"textarea",18),t.qZA(),t.qZA(),t.qZA(),t._UZ(33,"div",19),t.TgZ(34,"div",20),t.TgZ(35,"div",21),t.TgZ(36,"div",14),t._uU(37,"PREFERENCIAS"),t.qZA(),t.qZA(),t._UZ(38,"br"),t.TgZ(39,"div",22),t.TgZ(40,"div",14),t._uU(41,"Categorias"),t.qZA(),t.YNc(42,x,2,0,"div",23),t.TgZ(43,"mat-form-field",24),t.TgZ(44,"mat-label"),t._uU(45,"Seleccionar"),t.qZA(),t.TgZ(46,"mat-select"),t.YNc(47,R,3,4,"mat-option",25),t.qZA(),t.qZA(),t.TgZ(48,"mat-chip-list"),t.YNc(49,F,6,3,"mat-chip",26),t.qZA(),t.qZA(),t._UZ(50,"br"),t.TgZ(51,"div",27),t.TgZ(52,"div",14),t._uU(53,"Etiquetas"),t.qZA(),t.YNc(54,y,2,0,"div",23),t.TgZ(55,"mat-form-field",24),t.TgZ(56,"mat-label"),t._uU(57,"Seleccionar"),t.qZA(),t.TgZ(58,"mat-select"),t.YNc(59,L,3,4,"mat-option",25),t.qZA(),t.qZA(),t.TgZ(60,"mat-form-field",15),t.TgZ(61,"mat-chip-list",28,29),t.YNc(63,N,4,6,"mat-chip",30),t.TgZ(64,"input",31),t.NdJ("matChipInputTokenEnd",function(g){return o.add(g)}),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t._UZ(65,"br"),t.TgZ(66,"div",32),t.TgZ(67,"mat-card-actions",33),t.TgZ(68,"button",34),t._uU(69,"Guardar"),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t.qZA(),t.qZA()}if(2&a){const _=t.MAs(62);t.xp6(6),t.Q6J("formGroup",o.formularioPerfil),t.xp6(5),t.Q6J("src",o.foto.contenido||"../../../../assets/imagenes/no-image.png",t.LSH),t.xp6(2),t.hij(" @",null==o.usuario?null:o.usuario.nombre," "),t.xp6(29),t.Q6J("ngIf",!o.hayCategorias),t.xp6(5),t.Q6J("ngForOf",o.allCategorias),t.xp6(2),t.Q6J("ngForOf",o.categorias),t.xp6(5),t.Q6J("ngIf",!o.hayEtiquetas),t.xp6(5),t.Q6J("ngForOf",o.allEtiquetas),t.xp6(4),t.Q6J("ngForOf",o.etiquetas),t.xp6(1),t.Q6J("matChipInputFor",_)("matChipInputSeparatorKeyCodes",o.separatorKeysCodes)("matChipInputAddOnBlur",o.addOnBlur)}},directives:[b.a8,b.dk,b.dn,n._Y,n.JL,n.sg,T.KE,n.Fj,M.Nt,n.JJ,n.u,A.O5,T.hX,I.gD,A.sg,Z.qn,Z.oH,b.hq,q.lW,S.ey,Z.HS,Z.qH,D.Hw],pipes:[A.rS],styles:[".full-width[_ngcontent-%COMP%]{width:100%}.redondear[_ngcontent-%COMP%]{border-radius:20px}.tamano[_ngcontent-%COMP%]{width:40%;height:max-content}.fondo[_ngcontent-%COMP%]{display:flex;justify-content:center;height:auto;min-height:100%;align-items:center;background-color:#7b1fa2}.centrar[_ngcontent-%COMP%]{display:flex;justify-content:center;font-size:40px}.titulo[_ngcontent-%COMP%]{font-size:35px}.subtitulo[_ngcontent-%COMP%]{font-size:23px}#header[_ngcontent-%COMP%]{width:100%;height:7%;margin:3px}#contenido[_ngcontent-%COMP%]{width:100%;height:93%;margin:3px}.imagen[_ngcontent-%COMP%]{width:100%}.boton[_ngcontent-%COMP%]{width:50%;font-size:25px}.mat-action[_ngcontent-%COMP%]{display:flex;justify-content:center;align-items:center}#izquierda[_ngcontent-%COMP%]{height:100%;width:25%;float:left}#derecha[_ngcontent-%COMP%]{height:100%;width:74%;float:right}#descripcion[_ngcontent-%COMP%]{height:40%;width:100%}#preferencias[_ngcontent-%COMP%]{height:40%;width:100%}#vacio[_ngcontent-%COMP%]{height:10%;background:saddlebrown}#footer[_ngcontent-%COMP%]{height:10%}.text-area[_ngcontent-%COMP%]{height:33%}#categorias[_ngcontent-%COMP%]{height:44%}#etiquetas[_ngcontent-%COMP%]{height:44%}#titulo-pref[_ngcontent-%COMP%]{height:13%}.nombre-usuario[_ngcontent-%COMP%]{font-size:27px;margin:9px 2px}.invisible[_ngcontent-%COMP%]{display:none}"]}),l})()},9947:(p,h,i)=>{i.d(h,{F:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorPerfil"}agregarPerfil(e){return this.http.post(`${this.baseUrl}?accion=crearPerfil`,e)}obtenerCategorias(){return this.http.get(`${this.baseUrl}?accion=obtenerCategorias`)}obtenerEtiquetas(){return this.http.get(`${this.baseUrl}?accion=obtenerEtiquetas`)}obtenerPerfil(e){return this.http.get(`${this.baseUrl}?accion=obtenerPerfil&nombre=${e}`)}obtenerCategoriasUsuario(e){return this.http.get(`${this.baseUrl}?accion=obtenerCategoriasUsuario&nombre=${e}`)}obtenerEtiquetasUsuario(e){return this.http.get(`${this.baseUrl}?accion=obtenerEtiquetasUsuario&nombre=${e}`)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},4021:(p,h,i)=>{i.d(h,{X:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorDescargarArchivo",this.urlArchivo="http://localhost:8080/REVISTLAND/controladorDescargarArchivo?accion=descargarArchivo&idArchivo="}getBaseUrlArchivos(){return this.urlArchivo}obtenerDetalleRevista(e){return this.http.get(`${this.baseUrl}?accion=descargarArchivo&idArchivo=${e}`)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},842:(p,h,i)=>{i.d(h,{V:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorDescripcionRevista"}obtenerDetalleRevista(e){return this.http.get(`${this.baseUrl}?accion=obtenerDescripcionRevista&idRevista=${e}`)}obtenerVolumenesRevista(e){return this.http.get(`${this.baseUrl}?accion=obtenerVolumenesRevista&idRevista=${e}`)}obtenerRevistas(e){return this.http.get(`${this.baseUrl}?accion=obtenerRevistas&editor=${e}`)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},4307:(p,h,i)=>{i.d(h,{$:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorInteracciones"}comentar(e){return this.http.post(`${this.baseUrl}?accion=comentar`,e)}meGusta(e){return this.http.post(`${this.baseUrl}?accion=darMeGusta`,e)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},5828:(p,h,i)=>{i.d(h,{T:()=>s});var n=i(7716),d=i(1841);let s=(()=>{class r{constructor(e){this.http=e,this.baseUrl="http://localhost:8080/REVISTLAND/controladorPermisosRevista"}permitirSuscripciones(e){return this.http.get(`${this.baseUrl}?accion=permitirSuscripciones&idPublicacion=${e}`)}esInteractiva(e){return this.http.get(`${this.baseUrl}?accion=esInteractiva&idPublicacion=${e}`)}cambiarValorPermitirSuscripciones(e){return this.http.post(`${this.baseUrl}?accion=cambiarValorPermitirSuscripciones`,e)}cambiarValorEsInteractiva(e){return this.http.post(`${this.baseUrl}?accion=cambiarValorEsInteractiva`,e)}}return r.\u0275fac=function(e){return new(e||r)(n.LFG(d.eN))},r.\u0275prov=n.Yz7({token:r,factory:r.\u0275fac,providedIn:"root"}),r})()},760:(p,h,i)=>{i.d(h,{s:()=>e});var n=i(8583),d=i(2898),s=i(3356),r=i(3679),t=i(7716);let e=(()=>{class m{}return m.\u0275fac=function(b){return new(b||m)},m.\u0275mod=t.oAB({type:m}),m.\u0275inj=t.cJS({imports:[[n.ez,d.q,s.o9,r.UX]]}),m})()},2351:(p,h,i)=>{i.d(h,{M:()=>n});class n{constructor(s,r,t,e){this._nombreUsuario=s,this._comentario=r,this._fecha=t,this._idPulicacion=e}get nombreUsuario(){return this._nombreUsuario}set nombreUsuario(s){this._nombreUsuario=s}get idPulicacion(){return this._idPulicacion}set idPulicacion(s){this._idPulicacion=s}get fecha(){return this._fecha}set fecha(s){this._fecha=s}get comentario(){return this._comentario}set comentario(s){this._comentario=s}}},3948:(p,h,i)=>{i.d(h,{j:()=>n});class n{constructor(s,r){this._nombre=s,this._contenido=r}get contenido(){return this._contenido}set contenido(s){this._contenido=s}get nombre(){return this._nombre}set nombre(s){this._nombre=s}}}}]);