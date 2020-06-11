unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmDiplom = class(TForm)
    btnGraph: TButton;
    iGraph: TImage;
    pnlGraph: TPanel;
    procedure btnGraphClick(Sender: TObject);
  end;

var
  frmDiplom: TfrmDiplom;

implementation

{$R *.dfm}

uses
  Graph, ShellApi;

procedure TfrmDiplom.btnGraphClick(Sender: TObject);
const
  DOTFileName = 'graph.dot';
  GraphFileName = 'graph.bmp';
begin
  var VertexList := TVertexList.Create;
  try
    var Vertex1 := TVertex.Create(1, 'Сложение');
    Vertex1.AddOutputIndicator(1, 'научились складывать');
    VertexList.Add(Vertex1);

    var Vertex2 := TVertex.Create(2, 'Вычитание');
    Vertex2.AddInputIndicator(1, 'научились складывать');
    Vertex2.AddInputIndicator(4, 'умеем делить');
    Vertex2.AddOutputIndicator(2, 'умеем вычитать');
    VertexList.Add(Vertex2);

    var Vertex3 := TVertex.Create(2, 'Умножение');
    Vertex3.AddInputIndicator(1, 'научились складывать');
    Vertex3.AddOutputIndicator(3, 'умеем умножать');
    VertexList.Add(Vertex3);

    var Vertex4 := TVertex.Create(3, 'Деление');
    Vertex4.AddInputIndicator(1, 'научились складывать');
    Vertex4.AddInputIndicator(2, 'умеем вычитать');
    Vertex4.AddInputIndicator(3, 'умеем умножать');
    Vertex4.AddOutputIndicator(4, 'умеем делить');
    VertexList.Add(Vertex4);

    var Vertex5 := TVertex.Create(1, 'Чтение');
    Vertex5.AddInputIndicator(1, 'научились складывать');
    Vertex5.AddOutputIndicator(5, 'умеем читать');
    VertexList.Add(Vertex5);

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
