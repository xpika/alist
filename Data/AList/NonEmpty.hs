module Data.AList.NonEmpty where 
import Prelude hiding (sum)
import Data.Semigroup

data AListNonEmpty a = AListNonEmptyAppend (AListNonEmpty a) (AListNonEmpty a)
                     | AListNonEmptySingle a
  deriving (Read,Show)

instance Foldable AListNonEmpty where
   foldMap f (AListNonEmptySingle a) = f a
   foldMap f (AListNonEmptyAppend a b) = foldMap f a `mappend` foldMap f b

append = AListNonEmptyAppend

instance Semigroup (AListNonEmpty a) where
 (<>) = append
