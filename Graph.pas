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
