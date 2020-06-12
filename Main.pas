unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.DBCtrls;

type
  TfrmDiplom = class(TForm)
    btnGraph: TButton;
    iGraph: TImage;
    pnlGraph: TPanel;
    ADOConnection1: TADOConnection;
    cbPlan: TDBComboBox;
    ADOQuery1: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
  end;

var
  frmDiplom: TfrmDiplom;

implementation

{$R *.dfm}

uses
  Graph, ShellApi;

procedure TfrmDiplom.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
end;

procedure TfrmDiplom.btnGraphClick(Sender: TObject);
const
  DOTFileName = 'graph.dot';
  GraphFileName = 'graph.bmp';
begin
  var VertexList := TVertexList.Create;
  try
    ADOStoredProc1.Close;
    ADOStoredProc1.Parameters.ParamByName('@id_plan').Value := cbPlan.DataSource.DataSet.FieldByName('id_plan').AsInteger;
    ADOStoredProc1.Open;
    VertexList.FillFromDataSet(ADOStoredProc1);
    ADOStoredProc1.Close;
    VertexList.FillLinks;
    VertexList.CheckGraph;
    var CurrentDirectory := GetCurrentDir + '\dot\';
    var DOTFile: System.Text;
    AssignFile(DOTFile, CurrentDirectory + DOTFileName, CP_UTF8);
    Rewrite(DOTFile);
    Write(DOTFile, VertexList.GetDOT);
    CloseFile(DOTFile);
    var FileName := CurrentDirectory + GraphFileName;
    DeleteFile(FileName);
    ShellExecute(0, 'open', PChar('dot.exe'), PChar(' -Tbmp ' + DOTFileName + ' -o ' + GraphFileName), PChar(CurrentDirectory), SW_HIDE);
    Sleep(100);
    if FileExists(FileName) then
      iGraph.Picture.Bitmap.LoadFromFile(FileName);
  finally
    VertexList.Free;
  end;
end;

end.
