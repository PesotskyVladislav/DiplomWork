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
    var Vertex1 := TVertex.Create(1, '��������');
    Vertex1.AddOutputIndicator(1, '��������� ����������');
    VertexList.Add(Vertex1);

    var Vertex2 := TVertex.Create(2, '���������');
    Vertex2.AddInputIndicator(1, '��������� ����������');
    Vertex2.AddInputIndicator(4, '����� ������');
    Vertex2.AddOutputIndicator(2, '����� ��������');
    VertexList.Add(Vertex2);

    var Vertex3 := TVertex.Create(2, '���������');
    Vertex3.AddInputIndicator(1, '��������� ����������');
    Vertex3.AddOutputIndicator(3, '����� ��������');
    VertexList.Add(Vertex3);

    var Vertex4 := TVertex.Create(3, '�������');
    Vertex4.AddInputIndicator(1, '��������� ����������');
    Vertex4.AddInputIndicator(2, '����� ��������');
    Vertex4.AddInputIndicator(3, '����� ��������');
    Vertex4.AddOutputIndicator(4, '����� ������');
    VertexList.Add(Vertex4);

    var Vertex5 := TVertex.Create(1, '������');
    Vertex5.AddInputIndicator(1, '��������� ����������');
    Vertex5.AddOutputIndicator(5, '����� ������');
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
