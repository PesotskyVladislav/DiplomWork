program DiplomWork;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmDiplom},
  Graph in 'Graph.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDiplom, frmDiplom);
  Application.Run;
end.
