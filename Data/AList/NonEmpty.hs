module Data.AList.NonEmpty where 
import Prelude hiding (sum)
import Data.Semigroup

data AListNonEmpty a = AListNonEmptyAppend (AListNonEmpty a) (AListNonEmpty a)
                     | AListNonEmptySingle a
  deriving (Read,Show)

append = AListNonEmptyAppend

instance Semigroup (AListNonEmpty a) where
 (<>) = append
