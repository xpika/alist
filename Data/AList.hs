module Data.AList where 
import Data.Monoid

data AList a = AListEmpty
             | AList (AList a) (AList a)
  deriving (Read,Show)

append a@(AList _ _) b@(AList _ _) = AList a b 
append AListEmpty a = a
append a AListEmpty = a

instance Monoid (AList a) where 
 mempty = AListEmpty
 mappend = append

