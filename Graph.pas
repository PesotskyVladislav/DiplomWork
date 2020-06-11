unit Graph;

interface

uses
  System.Generics.Collections;

type
  TDFSColor = (dfsWhite, dfsGray, dfsBlack);

  TIndicator = class
  strict private
    FDescription: string;
    FID: Integer;
    function GetID: Integer;
  public
    constructor Create(const ID: Integer; const Description: string);
    property ID: Integer read GetID;
  end;

  TIndicatorList = class(TObjectList<TIndicator>);

  TVertexList = class;

  TVertex = class
  strict private
    FCommonTerm: Boolean;
    FCycle: Boolean;
    FDFSColor: TDFSColor;
    FInputIndicatorList: TIndicatorList;
    FName: string;
    FNextVertex: TVertexList;
    FOutputIndicatorList: TIndicatorList;
    FPrevVertex: TVertexList;
    FTerm: Integer;
    function GetCommonTerm: Boolean;
    procedure SetCommonTerm(const Value: Boolean);
    function GetCycle: Boolean;
    procedure SetCycle(const Value: Boolean);
    function GetDFSColor: TDFSColor;
    procedure SetDFSColor(const Value: TDFSColor);
    function GetInputIndicatorList: TIndicatorList;
    function GetName: string;
    function GetNextVertex: TVertexList;
    function GetOutputIndicatorList: TIndicatorList;
    function GetPrevVertex: TVertexList;
    function GetTerm: Integer;
  public
    constructor Create(const Term: Integer; const Name: string);
    destructor Destroy;
    procedure AddInputIndicator(const ID: Integer; const Description: string);
    procedure AddOutputIndicator(const ID: Integer; const Description: string);
    property CommonTerm: Boolean read GetCommonTerm write SetCommonTerm;
    property Cycle: Boolean read GetCycle write SetCycle;
    property DFSColor: TDFSColor read GetDFSColor write SetDFSColor;
    property InputIndicatorList: TIndicatorList read GetInputIndicatorList;
    property Name: string read GetName;
    property NextVertex: TVertexList read GetNextVertex;
    property OutputIndicatorList: TIndicatorList read GetOutputIndicatorList;
    property PrevVertex: TVertexList read GetPrevVertex;
    property Term: Integer read GetTerm;
  end;

  TVertexList = class(TObjectList<TVertex>)
  strict private
    procedure DFS(const CurrentVertex: TVertex);
  public
    procedure CheckGraph;
    procedure FillLinks;
    function GetDOT: string;
  end;

implementation

uses
  System.SysUtils, System.StrUtils;

function TVertex.GetCommonTerm: Boolean;
begin
  Result := FCommonTerm;
end;

procedure TVertex.SetCommonTerm(const Value: Boolean);
begin
  FCommonTerm := Value;
end;

function TVertex.GetCycle: Boolean;
begin
  Result := FCycle;
end;

procedure TVertex.SetCycle(const Value: Boolean);
begin
  FCycle := Value;
end;

function TVertex.GetDFSColor: TDFSColor;
begin
  Result := FDFSColor;
end;

procedure TVertex.SetDFSColor(const Value: TDFSColor);
begin
  FDFSColor := Value;
end;

function TVertex.GetInputIndicatorList: TIndicatorList;
begin
  Result := FInputIndicatorList;
end;

function TVertex.GetName: string;
begin
  Result := FName;
end;

function TVertex.GetNextVertex: TVertexList;
begin
  Result := FNextVertex;
end;

function TVertex.GetOutputIndicatorList: TIndicatorList;
begin
  Result := FOutputIndicatorList;
end;

function TVertex.GetPrevVertex: TVertexList;
begin
  Result := FPrevVertex;
end;

function TVertex.GetTerm: Integer;
begin
  Result := FTerm;
end;

constructor TVertex.Create(const Term: Integer; const Name: string);
begin
  FInputIndicatorList := TIndicatorList.Create;
  FOutputIndicatorList := TIndicatorList.Create;
  FPrevVertex := TVertexList.Create(False);
  FNextVertex := TVertexList.Create(False);
  FTerm := Term;
  FName := Name;
  FDFSColor := dfsWhite;
  FCycle := False;
  FCommonTerm := False;
end;

destructor TVertex.Destroy;
begin
  FInputIndicatorList.Free;
  FOutputIndicatorList.Free;
  FPrevVertex.Free;
  FNextVertex.Free;
end;

procedure TVertex.AddInputIndicator(const ID: Integer; const Description: string);
begin
  var Indicator := TIndicator.Create(ID, Description);
  FInputIndicatorList.Add(Indicator);
end;

procedure TVertex.AddOutputIndicator(const ID: Integer; const Description: string);
begin
  var Indicator := TIndicator.Create(ID, Description);
  FOutputIndicatorList.Add(Indicator);
end;

procedure TVertexList.DFS(const CurrentVertex: TVertex);
begin
  CurrentVertex.DFSColor := dfsGray;
  for var NextVertex in CurrentVertex.NextVertex do
  begin
    if NextVertex.DFSColor = dfsWhite then
      DFS(NextVertex);
    if NextVertex.DFSColor = dfsGray then
      NextVertex.Cycle := True;
    if NextVertex.DFSColor = dfsBlack then
      CurrentVertex.DFSColor := dfsBlack;
    NextVertex.DFSColor := dfsBlack;
  end;

procedure TVertexList.CheckGraph;
begin
  for var Vertex in Self do
  begin
    if Vertex.PrevVertex.Count > 0 then
      Continue;
    DFS(Vertex);
  end;
end;

procedure TVertexList.FillLinks;
begin
  for var CurrentVertex: TVertex in Self do
  begin
    for var OutputIndicator in CurrentVertex.OutputIndicatorList do
    begin
      for var NextVertex: TVertex in Self do
      begin
        for var InputIndicator in NextVertex.InputIndicatorList do
        begin
          if InputIndicator.ID = OutputIndicator.ID then
          begin
            CurrentVertex.NextVertex.Add(NextVertex);
            NextVertex.PrevVertex.Add(CurrentVertex);
            if CurrentVertex.Term = NextVertex.Term then
            begin
              CurrentVertex.CommonTerm := True;
              NextVertex.CommonTerm := True;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TVertexList.GetDOT: string;
begin
  Result := Result + 'digraph G { rankdir=LR; node[label=""];';
  for var Vertex in Self do
  begin
    Result := Result + Vertex.Name + '[label="' + Vertex.Name + '\n' + Vertex.Term.ToString + ' �������"';
    if Vertex.Cycle then
      Result := Result + ' style="filled" fillcolor="LightBlue"'
    else if Vertex.CommonTerm then
      Result := Result + ' style="filled" fillcolor="Moccasin"';
    Result := Result + '];';
    var BoldLine := Vertex.Cycle or Vertex.CommonTerm;
    for var NextVertex in Vertex.NextVertex do
      Result := Result + Vertex.Name + '->' + NextVertex.Name + IFThen(BoldLine, ' [penwidth=3.0]', '') + ';';
  end;
  Result := Result + '}';
end;

function TIndicator.GetID: Integer;
begin
  Result := FID;
end;

constructor TIndicator.Create(const ID: Integer; const Description: string);
begin
  FID := ID;
  FDescription := Description;
end;

end.
