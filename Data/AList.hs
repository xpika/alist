module Data.AList where 
import Prelude hiding (sum)
import Data.Monoid
import Data.Semigroup
import Data.Foldable

data AList a = AListTip a
             | AListAppend (AList a) (AList a)
             | AListEmpty
  deriving (Read,Show)

singleton x = AListTip x
append = AListAppend 

instance Eq a => Eq (AList a) where
  alist == alist' = toList alist == toList alist'

instance Ord a => Ord (AList a) where
  compare alist alist' = compare (toList alist) (toList alist')

instance Foldable AList where
   foldMap f AListEmpty = mempty
   foldMap f (AListTip a) = f a
   foldMap f (AListAppend a b) = foldMap f a `mappend` foldMap f b

cons x alist = singleton x `append` alist 
snoc alist x = alist `append` singleton x

drawAList x = '[' : drawAList' x ++ "]"
drawAList' AListEmpty = ""
drawAList' (AListAppend a b) = drawAList' a ++ "," ++ drawAList' b
drawAList' (AListTip a) = show a 

instance Monoid (AList a) where
 mempty = AListEmpty
 mappend = append

-- this doesn't technically associate
instance Semigroup (AList a) where
 (<>) = append
