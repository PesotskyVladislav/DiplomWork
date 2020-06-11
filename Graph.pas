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
  public
    constructor Create(const Term: Integer; const Name: string);
    destructor Destroy;
    procedure AddInputIndicator(const ID: Integer; const Description: string);
    procedure AddOutputIndicator(const ID: Integer; const Description: string);
  end;

  TVertexList = class(TObjectList<TVertex>)
  end;

implementation


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
