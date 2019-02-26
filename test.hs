import Data.AList
import Data.DList

eg = Data.AList.singleton 2

applyNTimes _ 0 = id
applyNTimes f x = applyNTimes f (x-1)

--sumEg = Data.AList.sum $ applyNTimes (\x ->  eg `append` eg `append`) 
