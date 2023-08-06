program SingleLinkedList;

type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;

procedure InitList(var first: LongItemPtr; var last: LongItemPtr);
begin
    first := nil;
    last := nil;
end;

procedure AddToList(var first: LongItemPtr; var last: LongItemPtr; n: longint);
var
    tmp: LongItemPtr;
begin
    if first = nil then
        begin
            new(first);
            first^.data := n;
            first^.next := nil;
            last := first;
        end
    else
        begin
            new(tmp);
            tmp^.data := n;
            tmp^.next := nil;
            last^.next := tmp;
            last := tmp;
        end
end;

procedure PrintList(var first: LongItemPtr);
var
    tmp: LongItemPtr;
begin
    tmp := first;
    while tmp <> nil do
    begin
        write(tmp^.data, ' ');
        tmp := tmp^.next;
    end;
    writeln;
end;