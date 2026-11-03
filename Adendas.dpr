program Adendas;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uniguioperadores in 'uniguioperadores.pas',
  uniguiusqlutils in 'uniguiusqlutils.pas',
  UDBModulo in 'UDBModulo.pas' {DM1: TDataModule},
  uFrmDatosadenda in 'uFrmDatosadenda.pas' {FrmDatosadenda: TUniForm},
  uFrmAdenda in 'uFrmAdenda.pas' {Frmadenda: TUniForm},
  uFrmpersona in 'uFrmpersona.pas' {Frmpersona: TUniForm},
  uFrmDatospersonaPadron in 'uFrmDatospersonaPadron.pas' {FrmDatospersonaPadron: TUniForm},
  uModeloPersona in 'uModeloPersona.pas',
  umodeloadenda in 'umodeloadenda.pas',
  uFrmDatosMovPadron in 'uFrmDatosMovPadron.pas' {FrmDatosMovPadron: TUniForm},
  uFrmMovPadron in 'uFrmMovPadron.pas' {FrmMovPadron: TUniForm},
  uModeloMovPadron in 'uModeloMovPadron.pas',
  uModelocaserio in 'uModelocaserio.pas',
  uFrmcaserio in 'uFrmcaserio.pas' {Frmcaserio: TUniForm},
  uFrmDatoscaserio in 'uFrmDatoscaserio.pas' {FrmDatoscaserio: TUniForm},
  uModeloUsuario in 'uModeloUsuario.pas',
  uFrmUsuario in 'uFrmUsuario.pas' {FrmUsuario: TUniForm},
  uFrmDatosUsuario in 'uFrmDatosUsuario.pas' {FrmDatosUsuario: TUniForm},
  uModeloPadron in 'uModeloPadron.pas',
  ufrmbuscador in 'ufrmbuscador.pas' {FrmBuscador: TUniForm},
  uFrmActividad in 'uFrmActividad.pas' {FrmActividad: TUniForm},
  uFrmDatosActividad in 'uFrmDatosActividad.pas' {FrmDatosActividad: TUniForm},
  uModeloActividad in 'uModeloActividad.pas',
  uNativeXLSExport in 'uNativeXLSExport.pas',
  uModelopadronactividad in 'uModelopadronactividad.pas',
  uModelomovPadronActividad in 'uModelomovPadronActividad.pas',
  uFrmmovimientos in 'uFrmmovimientos.pas' {Frmmovimientos: TUniForm},
  uFrmDatosmovimientos in 'uFrmDatosmovimientos.pas' {FrmDatosmovimientos: TUniForm},
  uModelomovimientos in 'uModelomovimientos.pas',
  uFrmAutoridad in 'uFrmAutoridad.pas' {FrmAutoridad: TUniForm},
  uModeloAutoridad in 'uModeloAutoridad.pas',
  uFrmDatosAutoridad in 'uFrmDatosAutoridad.pas' {FrmDatosAutoridad: TUniForm},
  ureportes in 'ureportes.pas' {frmReportes: TUniForm},
  uFrmVistaPrevia in 'uFrmVistaPrevia.pas' {FrmVistaPrevia: TUniForm},
  umensajes in 'umensajes.pas' {frmMensajes: TUniForm},
  udataglobal in 'udataglobal.pas' {DataGlobal: TDataModule},
  UfrmCambioFenologico in 'UfrmCambioFenologico.pas' {frmCambioFenologico: TUniForm},
  uModeloinformes in 'uModeloinformes.pas',
  uFrmSIMDEV in 'uFrmSIMDEV.pas' {FrmSIMDEV: TUniForm},
  uFrmDatosSIMDEV in 'uFrmDatosSIMDEV.pas' {FrmDatosSIMDEV: TUniForm},
  uModeloSIMDEV in 'uModeloSIMDEV.pas',
  uFrmSubirTitulo in 'uFrmSubirTitulo.pas' {FrmSubirTitulo: TUniForm},
  uFrmpadron in 'uFrmpadron.pas' {Frmpadron: TUniForm},
  uFrmDatospersona in 'uFrmDatospersona.pas' {FrmDatospersona: TUniForm},
  umodeloInformeV2 in 'umodeloInformeV2.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;

end.

