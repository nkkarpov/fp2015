import Data.Functor
import Control.Applicative

newtype Cmps f g x = Cmps {getCmps :: f (g x)} deriving (Eq,Show)

instance (Functor f, Functor g) => Functor (Cmps f g) where
	fmap f (Cmps x) = Cmps (fmap (fmap f) x)

instance (Applicative f, Applicative g) => Applicative (Cmps f g) where
	pure x = Cmps (pure (pure x))
	Cmps f <*> Cmps x = Cmps ((<*>) <$> f <*> x)
