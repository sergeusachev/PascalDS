program remove_zeros;

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

//without disposing memory
procedure RemoveNegativeNumbers(var first: LongItemPtr);
var
    cur, prev, newFirst: LongItemPtr;
begin
    newFirst := first;
    cur := first;
    prev := nil;
    while cur <> nil do
    begin
        if cur^.data < 0 then
            begin
                if cur = newFirst then
                    begin
                        newFirst := cur^.next;
                        prev := newFirst;
                    end
                else
                    begin
                        prev^.next := cur^.next;
                    end;
                cur := cur^.next;
            end
        else
            begin
                prev := cur;
                cur := cur^.next;
            end;
    end;
    first := newFirst;
end;

procedure RemoveNegativesNumbers2(var first: LongItemPtr);
var
    tmp: LongItemPtr;
    pp: ^LongItemPtr;
begin
    pp := @first;
    while pp^ <> nil do
    begin
        if pp^^.data < 0 then
            begin
                tmp := pp^;
                pp^ := pp^^.next;
                dispose(tmp);
            end
        else
            pp := @(pp^^.next);
    end
end;

var
    first, last: LongItemPtr;
    n: longint;
begin
    InitList(first, last);
    while not eof do
    begin
        readln(n);
        AddToList(first, last, n);
    end;

    PrintList(first);
    RemoveNegativeNumbers(first);
    PrintList(first);
end.