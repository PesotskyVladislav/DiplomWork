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
  end;

  TVertexList = class(TObjectList<TVertex>)
  end;

implementation


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
