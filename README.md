# alist
append lists. lists with O(1) append

Data.AList Data.Foldable> toList $ snoc (snoc (cons '0' $ cons '1' $ singleton 'a') 'b') 'c'
"01abc"

Check out DList or Sequence if you need something more advanced.
