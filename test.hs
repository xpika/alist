import Data.AList
import Data.DList

eg = AListAppend (AListTip 1) (AListAppend (AListTip 10) (AListTip 100))

sumEg = Data.AList.sum $ eg
