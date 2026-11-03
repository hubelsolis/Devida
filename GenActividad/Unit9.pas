unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TForm9 = class(TForm)
    Base_datos: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnconect: TButton;
    btnconsult: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    mmo1: TMemo;
    btngenmv: TButton;
    btnpasa: TButton;
    ListaActividad: TCheckListBox;
    Button5: TButton;
    Button6: TButton;
    lblCampos: TLabel;
    laaasfsd: TLabel;
    Label1: TLabel;
    chktotal: TCheckListBox;
    mmoetapas: TMemo;
    ZQuery2: TZQuery;
    mmoBy: TMemo;
    mmoField: TMemo;
    Edit3: TEdit;
    mmoSQL: TMemo;
    procedure btnconectClick(Sender: TObject);
    procedure btnconsultClick(Sender: TObject);
    procedure btnpasaClick(Sender: TObject);
    procedure btngenmvClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses operadoresMini;

{$R *.dfm}

procedure TForm9.btnconectClick(Sender: TObject);
begin
   btnconect.Enabled:=false;
   btnconsult.Enabled:=true;
   base_datos.HostName:='localhost';
   base_datos.Database:=edit1.Text;
   base_datos.User:='sysdba';
   base_datos.Password:='baex1623';
   base_datos.Connect;
end;

procedure TForm9.btnconsultClick(Sender: TObject);
begin
  btnpasa.Enabled:=true;
  zquery1.Close;
  zquery1.SQL.Clear;
  zquery1.SQL.Add(edit2.Text);
  zquery1.Open;
end;

procedure TForm9.btngenmvClick(Sender: TObject);
var ce,ci,i,pos : integer;
    nomAct,linea : string;
    etapa : string;

    procedure AgregaLinea;
     begin
       mmo1.Lines.Add(FormatSQL3(Linea)+',');
     end;

    function procEtapa(Sact,Setapa,Cetapa : String):string;
     begin
       if buscaStr(Cetapa,',') then
         begin
           result:=nomact+'_'+StrCom(StrCom(etapa,'HAS ',''),' ','');
         end
       Else
         result:=Sact;
     end;

    function procAct(sact : string) : String;
     begin
       result := StrCom(Sact,'.','');
     end;

begin
  // esto genera el movprado
  mmo1.clear;
  mmo1.Lines.Add('select ');
  mmo1.Lines.Add('p.idadenda,p.Idmovpadron,p.Idcaserio, ');
  mmo1.Lines.Add('(select c.AMBITO     from caserio c where c.Idcaserio=p.Idcaserio), ');
  mmo1.Lines.Add('(select c.PROVINCIA  from caserio c where c.Idcaserio=p.Idcaserio), ');
  mmo1.Lines.Add('(select c.DISTRITO   from caserio c where c.Idcaserio=p.Idcaserio), ');
  mmo1.Lines.Add('(select c.CASERIO    from caserio c where c.Idcaserio=p.Idcaserio), ');
  mmo1.Lines.Add('p.Dni_titular, ');
  mmo1.Lines.Add('(select c.nombre     from Persona c where c.dni=p.Dni_titular), ');
  mmo1.Lines.Add('(select c.appaterno  from Persona c where c.Dni=p.Dni_titular), ');
  mmo1.Lines.Add('(select c.apmaterno  from Persona c where c.Dni=p.Dni_titular), ');
  mmo1.Lines.Add('(select c.fecnac     from Persona c where c.Dni=p.Dni_titular), ');
  mmo1.Lines.Add('p.Telefono, p.Dni_conyuge, ');
  mmo1.Lines.Add('(select c.nombre     from Persona c where c.dni=p.Dni_conyuge) nombre_conyuge, ');
  mmo1.Lines.Add('(select c.appaterno  from Persona c where c.Dni=p.Dni_conyuge) Appaterno_conyuge,');
  mmo1.Lines.Add('(select c.apmaterno  from Persona c where c.Dni=p.Dni_conyuge) apmaterno_conyuge, ');
  mmo1.Lines.Add('(select c.fecnac     from Persona c where c.Dni=p.Dni_conyuge) fecnac_conyuge,  ');
  mmo1.Lines.Add(' p.Tipomovimiento,p.subTipoMov,');
  mmo1.Lines.Add(' ');


  for ci:=0 to ListaActividad.items.count-1 do
  if ListaActividad.Checked[ci] then
   begin
     // todo order list
 //'CACAO',
 //'CACAO'  ,
// (select m.HAS_MOV from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS CREC') CACAO_CREC,
// (select m.HAS_MOV from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS PROD') CACAO_PROD,

     i:=ValI(mmoBy.lines[ci]);
     NomAct:=ListaActividad.Items[i];

     if chkTotal.Checked[i] then
      begin
        linea:='(select SUM(m.HAS_MOV) from MOVPADRONACTIVIDAD m '+
               'where m.IDMOVPADRON=p.IDMOVPADRON and '+
               'm.IDACTIVIDAD="'+NomAct+'" ) TOTAL_'+ProcAct(NomAct);
        AgregaLinea;
      end;
      ce:=1;
      while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
       begin
         etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);
         Linea:='(select m.HAS_MOV from MOVPADRONACTIVIDAD m '+
                'where m.IDMOVPADRON=p.IDMOVPADRON and '+
                'm.IDACTIVIDAD="'+NomAct+'"  and m.IDETAPA="'+etapa+'") '+ProcEtapa(ProcAct(nomAct),etapa,mmoEtapas.Lines[i]);
         AgregaLinea;
         inc(ce);
       end;

     mmo1.Lines.Add(' ');

   end;


  for ci:=0 to ListaActividad.items.count-1 do
  if ListaActividad.Checked[ci] then
   begin
   i:=ValI(mmoBy.lines[ci]);
   NomAct:=ListaActividad.Items[i];
   //'CACAO'  ,
   //(select m.ANIO_INSTALACION from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS CREC') ANIO_INST_CACAO_CREC,
   //(select m.ANIO_INSTALACION from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS PROD') ANIO_INST_CACAO_PROD,
    ce:=1;
    while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
     begin
       etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);

       Linea:='(select m.ANIO_INSTALACION from MOVPADRONACTIVIDAD m '+
       'where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD="'+nomact+
       '"  and m.IDETAPA="'+etapa+'") ANIO_INST_'+ProcEtapa(ProcAct(nomAct),etapa,mmoEtapas.Lines[i]);

       AgregaLinea;
       inc(ce);
     end;
    mmo1.Lines.Add(' ');
   end;

  mmo1.Lines.Add('p.Dni_tecnico,  ');
  mmo1.Lines.Add(FormatSQL3('(select n.nombre||" "||n.appaterno||" "||n.apmaterno from persona n where n.dni=p.Dni_tecnico) Nombre_Tecnico,  '));
  mmo1.Lines.Add('p.Observaciones_1, ');
  mmo1.Lines.Add('p.Observaciones_2, ');
  mmo1.Lines.Add('p.Observaciones_3, ');
  mmo1.Lines.Add('p.imagen1, ');
  mmo1.Lines.Add('p.imagen2, ');
  mmo1.Lines.Add(' ');
  mmo1.Lines.Add('p.dni_referencia, ');
  mmo1.Lines.Add('(select c.nombre     from Persona c where c.dni=p.dni_referencia) ref_nombre,  ');
  mmo1.Lines.Add('(select c.appaterno  from Persona c where c.Dni=p.dni_referencia) ref_appaterno,  ');
  mmo1.Lines.Add('(select c.apmaterno  from Persona c where c.Dni=p.dni_referencia) ref_apmaterno, ');
  mmo1.Lines.Add('P.DNI_REFCONYUGE, p.IDMOVREFERENCIA, ');
  mmo1.Lines.Add(' ');

// 'CACAO'   ,
// (select m.COORY   from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS INST') CACAO_INST_Y,
// (select m.ALTITUD from MOVPADRONACTIVIDAD m where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD='CACAO'   and m.IDETAPA='HAS INST') CACAO_INST_ALT,
  for ci:=0 to ListaActividad.items.count-1 do
  if ListaActividad.Checked[ci] then
   begin
   i:=ValI(mmoBy.lines[ci]);
   NomAct:=ListaActividad.Items[i];
    ce:=1;
    while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
     begin
       etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);

       Linea:='(select m.COORX   from MOVPADRONACTIVIDAD m '+
       'where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD="'+NomAct+'" '+
       'and m.IDETAPA="'+etapa+'") '+ProcEtapa(ProcAct(nomAct),etapa,mmoEtapas.Lines[i])+'_X';
       AgregaLinea;

       Linea:='(select m.COORY   from MOVPADRONACTIVIDAD m '+
       'where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD="'+NomAct+'" '+
       'and m.IDETAPA="'+etapa+'") '+ProcEtapa(ProcAct(nomAct),etapa,mmoEtapas.Lines[i])+'_Y';
       AgregaLinea;

       Linea:='(select m.ALTITUD   from MOVPADRONACTIVIDAD m '+
       'where m.IDMOVPADRON=p.IDMOVPADRON and m.IDACTIVIDAD="'+NomAct+'" '+
       'and m.IDETAPA="'+etapa+'") '+ProcEtapa(ProcAct(nomAct),etapa,mmoEtapas.Lines[i])+'_ALT';
       AgregaLinea;

       inc(ce);
     end;
    mmo1.Lines.Add(' ');
   end;


  mmo1.Lines.Add('p.DNI_AUTORIDAD,	');
  mmo1.Lines.Add('(select c.nombre     from Persona c where c.dni=p.DNI_AUTORIDAD) aut_nombre, 	');
  mmo1.Lines.Add('(select c.appaterno  from Persona c where c.Dni=p.DNI_AUTORIDAD) aut_appaterno, 	');
  mmo1.Lines.Add('(select c.apmaterno  from Persona c where c.Dni=p.DNI_AUTORIDAD) aut_apmaterno,	');
  mmo1.Lines.Add('  	');
  mmo1.Lines.Add('(select first 1 c.FECHA       from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_fecha,	');
  mmo1.Lines.Add('(select first 1 c.CARGO       from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_cargo,	');
  mmo1.Lines.Add('(select first 1 c.RESOLUCION  from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_resolucion, 	');
  mmo1.Lines.Add('		');
  mmo1.Lines.Add('(select first 1 skip 1 c.FECHA       from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_fecha2,	');
  mmo1.Lines.Add('(select first 1 skip 1 c.CARGO       from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_cargo2,	');
  mmo1.Lines.Add('(select first 1 skip 1 c.RESOLUCION  from AUTORIDAD c where c.Dni=p.DNI_AUTORIDAD and c.estado=1) aut_resolucion2 	');
  mmo1.Lines.Add('		');
  mmo1.Lines.Add('FROM movPadron p;	');

   // ahora hago la consulta para crear la vista
   zquery2.Close;
   zquery2.SQL.Clear;
   for i := 0 to mmo1.lines.Count-1 do
    begin
          zquery2.SQL.Add(mmo1.Lines[i]);
    end;
   zquery2.Open;

   if zquery2.Active then
    begin
      mmoField.Clear;
      for i := 0 to zquery2.Fields.Count-1 do
        mmoField.Lines.Add(zquery2.Fields[i].DisplayName );
    end;


   Linea:=edit3.text+' VIEW VMOVPADRON (';
   pos:=0;
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+mmoField.Lines[i]+','
       else
         linea:=linea+mmoField.Lines[i]+')';
       if length(Linea)>42 then
         begin
            mmo1.lines.Insert(pos,Linea);
            pos:=pos+1;
           linea:='';
         end;
     end;
   if linea<>'' then
    begin
      mmo1.lines.Insert(pos,Linea);
      pos:=pos+1;
    end;
   mmo1.lines.Insert(pos,'AS');


   mmoSQL.Clear;
   mmoSQL.Lines.add('select ');
   Linea:='';
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+mmoField.Lines[i]+','
       else
         linea:=linea+mmoField.Lines[i]+' ';
       if length(Linea)>42 then
         begin
            mmoSQL.lines.Add(linea);
           linea:='';
         end;
     end;
   if linea<>'' then
    begin
      mmoSQL.lines.add(Linea);
    end;
  mmoSQL.Lines.Add('from VMOVPADRON ');

end;

procedure TForm9.btnpasaClick(Sender: TObject);
var
  i: Integer;
  j: Integer;
  etapas : string;
begin
  if zquery1.Active then
   begin
     ListaActividad.Items.Clear;
     chktotal.Clear;
     mmoetapas.Clear;
     mmoby.Clear;
     zquery1.First;
     for i := 1 to zquery1.RecordCount do
       begin
         if i>1 then zquery1.Next;
         ListaActividad.Items.Add(zquery1.Fields[0].AsString);
         chkTotal.items.Add(' ');
         mmoby.lines.Add(IntToStr(i-1));

         zquery2.Close;
         zquery2.SQL.Clear;
         zquery2.sql.Add('SELECT a.IDETAPA FROM ACTIVIDADETAPA a '+
         'where a.IDACTIVIDAD='+chr(39)+zquery1.fields[0].AsString+chr(39)+' ORDER BY ORDEN');
         zquery2.Open;
         etapas:='';
         for j := 1 to zquery2.RecordCount do
          begin
            if j>1 then zquery2.Next;
            if etapas='' then
              etapas:=zquery2.fields[0].AsString
            else
              etapas:=etapas+','+zquery2.fields[0].AsString;
          end;
         mmoetapas.Lines.Add(etapas);
         ListaActividad.Checked[ ListaACtividad.Items.Count-1 ]:=true;
         if length(etapas)>10 then
         chkTotal.Checked[ chkTotal.Items.Count-1 ]:=true;
       end;
   end;

end;

procedure TForm9.Button5Click(Sender: TObject);
var i,cp: integer;
    linea : String;
begin
   mmo1.Lines.Clear;
   Linea:=edit3.text+' VIEW VMOVPADRONVOID (';
   mmo1.lines.add(Linea);
   Linea:='';
   cp:=0;
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+mmoField.Lines[i]+','
       else
         linea:=linea+mmoField.Lines[i]+')';
       cp:=cp+1;
       if cp>6 then
         begin
            mmo1.lines.add(Linea);
           linea:='';
           cp:=0;
         end;
     end;
   if linea<>'' then
     mmo1.lines.add(Linea);
   mmo1.lines.add('AS');

   mmo1.Lines.Add('select first 1 ');
   Linea:='';
   cp:=0;
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+'"",'
       else
         linea:=linea+'""';
       cp:=cp+1;
       if cp>6 then
         begin
            mmo1.lines.add(formatSQL3(Linea));
           linea:='';
           cp:=0;
         end;
     end;
   if linea<>'' then
     mmo1.lines.add(formatSQL3(Linea));
   mmo1.Lines.Add('FROM movPadron p;');

end;

procedure TForm9.Button6Click(Sender: TObject);
var ci,ce,i,pos : integer;
    NomAct,etapa,linea : string;

    procedure AgregaLinea;
     begin
       mmo1.Lines.Add(FormatSQL3(Linea)+',');
     end;

    function procEtapa(Sact,Setapa,Cetapa : String):string;
     begin
       if buscaStr(Cetapa,',') then
         begin
           result:=nomact+'_'+StrCom(StrCom(etapa,'HAS ',''),' ','');
         end
       Else
         result:=Sact;
     end;

    function procEtapaR(Sact,Setapa,Cetapa : String):string;
     begin
       if buscaStr(Cetapa,',') then
         begin
           result:=StrCom(StrCom(etapa,'HAS ',''),' ','')+'_'+nomact;
         end
       Else
         result:=Sact;
     end;

    function procAct(sact : string) : String;
     begin
       result := StrCom(Sact,'.','');
     end;

begin
  mmo1.Clear;
  mmo1.Lines.Add('SELECT a.IDPADRON, a.IDADENDA, a.IDCASERIO, a.CODIGO, a.OZ, a.AMBITO, a.DEPARTAMENTO, a.PROVINCIA, a.DISTRITO, a.CASERIO, ');
  mmo1.Lines.Add('a.ApPATERNO, a.ApMATERNO, a.NOMBRE, a.DNI, a.SEXO, a.ETNIA, a.LENGUA, a.TELEFONO, ');
  mmo1.Lines.Add('(select p.fecnac from persona p where p.DNI=a.dni) fecnac, ');
  mmo1.Lines.Add('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.dni) edad, ');
  mmo1.Lines.Add('a.CONY_ApPATERNO,a.CONY_ApMATERNO, a.CONY_NOMBRE, a.CONY_DNI, a.CONY_SEXO, a.CONY_ETNIA, a.CONY_LENGUA,');
  mmo1.Lines.Add('(select p.TELEFONO from persona p where p.DNI=a.CONY_dni) CONY_TELEFONO,');
  mmo1.Lines.Add('(select p.FECNAC from persona p where p.DNI=a.CONY_dni) CONY_fecnac, ');
  mmo1.Lines.Add('(select datediff (year, p.FECNAC, current_date) from persona p where p.DNI=a.CONY_dni) CONY_edad, ');
  mmo1.Lines.Add('a.ANIO_INCORPORACION, ');
  mmo1.Lines.Add(' ');

  for ci:=0 to ListaActividad.items.count-1 do
  if ListaActividad.Checked[ci] then
   begin
    //
    //(select p.HAS from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO' and p.IDETAPA='HAS CREC') CREC_CACAO,
    //(select p.HAS from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO' and p.IDETAPA='HAS PROD') PROD_CACAO,
    //p.IDACTIVIDAD='CACAO') TOTAL_CACAO,

     i:=ValI(mmoBy.lines[ci]);
     NomAct:=ListaActividad.Items[i];

      ce:=1;
      while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
       begin
         etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);

         if BuscaSTR(mmoEtapas.Lines[i],',') then
           Linea:='(select p.HAS from PADRONACTIVIDAD p '+
                  'where p.IDPADRON=a.IDPADRON and '+
                  'p.IDACTIVIDAD="'+NomAct+'" and p.IDETAPA="'+etapa+'") '+ProcEtapaR(ProcAct(nomAct),etapa,mmoEtapas.Lines[i])
         Else
           Linea:='(select p.HAS from PADRONACTIVIDAD p '+
                  'where p.IDPADRON=a.IDPADRON and '+
                  'p.IDACTIVIDAD="'+NomAct+'") ACT_'+ProcEtapaR(ProcAct(nomAct),etapa,mmoEtapas.Lines[i]);

         AgregaLinea;
         inc(ce);
       end;

     if chkTotal.Checked[i] then
      begin
        linea:='(select SUM(p.HAS) from PADRONACTIVIDAD p '+
               'where p.IDPADRON=a.IDPADRON and '+
               'p.IDACTIVIDAD="'+NomAct+'") TOTAL_'+NomAct;
        AgregaLinea;
      end;
     mmo1.Lines.Add(' ');


//,
//(select first 1 p.ANIO_INSTALACION from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO' AND p.IDETAPA='HAS CREC') ANIO_INST_CREC_CACAO,
//(select first 1 p.ANIO_INSTALACION from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO' AND p.IDETAPA='HAS PROD') ANIO_INST_PROD_CACAO,
     ce:=1;
     while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
       begin
         etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);
         Linea:='(select first 1 p.ANIO_INSTALACION from PADRONACTIVIDAD p '+
                'where p.IDPADRON=a.IDPADRON and '+
                'p.IDACTIVIDAD="'+NomAct+'" AND p.IDETAPA="'+etapa+'") ANIO_INST_'+ProcEtapaR(ProcAct(nomAct),etapa,mmoEtapas.Lines[i]);
         AgregaLinea;
         inc(ce);
       end;
     mmo1.Lines.Add(' ');

     ce:=1;
     while ( SplitCadena(mmoEtapas.Lines[i],',',ce)<>'') do
       begin
         etapa:=SplitCadena(mmoEtapas.Lines[i],',',ce);
         Linea:='(select first 1 p.ANIO_ADOPCION from PADRONACTIVIDAD p '+
                'where p.IDPADRON=a.IDPADRON and '+
                'p.IDACTIVIDAD="'+NomAct+'" AND p.IDETAPA="'+etapa+'") ANIO_ADOP_'+ProcEtapaR(ProcAct(nomAct),etapa,mmoEtapas.Lines[i]);
         AgregaLinea;
         inc(ce);
       end;
     mmo1.Lines.Add(' ');

   end;


  //(select first 1 p.COORX   from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO') COORX_CACAO,
  //(select first 1 p.COORY   from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO') COORY_CACAO,
  //(select first 1 p.ALTITUD from PADRONACTIVIDAD p where p.IDPADRON=a.IDPADRON and p.IDACTIVIDAD='CACAO') ALTITUD_CACAO,
  for ci:=0 to ListaActividad.items.count-1 do
  if ListaActividad.Checked[ci] then
   begin
    //

     i:=ValI(mmoBy.lines[ci]);
     NomAct:=ListaActividad.Items[i];

     Linea:='(select first 1 p.COORX   from PADRONACTIVIDAD p '+
            'where p.IDPADRON=a.IDPADRON and '+
            'p.IDACTIVIDAD="'+NomAct+'") COORX_'+ProcAct(nomAct);
     AgregaLinea;

     Linea:='(select first 1 p.COORY   from PADRONACTIVIDAD p '+
            'where p.IDPADRON=a.IDPADRON and '+
            'p.IDACTIVIDAD="'+NomAct+'") COORY_'+ProcAct(nomAct);
     AgregaLinea;

     Linea:='(select first 1 p.ALTITUD   from PADRONACTIVIDAD p '+
            'where p.IDPADRON=a.IDPADRON and '+
            'p.IDACTIVIDAD="'+NomAct+'") ALTITUD_'+ProcAct(nomAct);
     AgregaLinea;
     mmo1.Lines.Add(' ');
   end;

  mmo1.Lines.Add('a.OBSERVACIONES, a.JUSTIFICACION ');
  mmo1.Lines.Add('FROM PADRON a; ');


   // ahora hago la consulta para crear la vista
   zquery2.Close;
   zquery2.SQL.Clear;
   for i := 0 to mmo1.lines.Count-1 do
    begin
          zquery2.SQL.Add(mmo1.Lines[i]);
    end;
   zquery2.Open;

   if zquery2.Active then
    begin
      mmoField.Clear;
      for i := 0 to zquery2.Fields.Count-1 do
        mmoField.Lines.Add(zquery2.Fields[i].DisplayName );
    end;


  Linea:=edit3.text+' VIEW VPADRON (';
  pos:=0;
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+mmoField.Lines[i]+','
       else
         linea:=linea+mmoField.Lines[i]+')';
       if length(Linea)>42 then
         begin
            mmo1.lines.Insert(pos,Linea);
            pos:=pos+1;
           linea:='';
         end;
     end;
   if linea<>'' then
    begin
      mmo1.lines.Insert(pos,Linea);
      pos:=pos+1;
    end;
   mmo1.lines.Insert(pos,'AS');


   mmoSQL.Clear;
   mmoSQL.Lines.add('select ');
   Linea:='';
   for i :=0  to mmoField.Lines.Count-1 do
     begin
       if i<mmoField.Lines.Count-1 then
         linea:=linea+mmoField.Lines[i]+','
       else
         linea:=linea+mmoField.Lines[i]+' ';
       if length(Linea)>42 then
         begin
            mmoSQL.lines.Add(linea);
           linea:='';
         end;
     end;
   if linea<>'' then
    begin
      mmoSQL.lines.add(Linea);
    end;
   mmoSQL.Lines.Add('from VPADRON ');

end;

end.
