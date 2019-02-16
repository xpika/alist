module Data.AList where 
import Prelude hiding (sum)
import Data.Monoid
import Data.Semigroup

data AList a = AListTip a
             | AListAppend (AList a) (AList a)
             | AListEmpty
  deriving (Read,Show)

singleton x = AListTip x
append = AListAppend 

fold f base (AListAppend a b) = f (fold f base a) (fold f base b)
fold f base (AListTip x) = x
fold f base AListEmpty = base

sum = fold (+) 0

instance Monoid (AList a) where
 mempty = AListEmpty
 mappend = append

instance Semigroup (AList a) where
 (<>) = append
  
