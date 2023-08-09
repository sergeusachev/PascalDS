unit long_item_single_ptr;

interface
type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;

implementation

end.