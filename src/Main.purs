module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

-- `data Record :: # Type -> Type`
--
-- # Type are defined using parens ()
-- Records are constructed by providing row type params
-- Records can be constructed using the curly brace syntax sugar {}
-- see <https://pursuit.purescript.org/builtins/docs/Prim#t:Record>

-- # Type
type MyRow = ( apple :: Unit )

-- Type
type MyRecord = Record MyRow

-- Type
type MyRecord' = { apple :: Unit }

-- Type, where `|` means "extended by"
type MyRecord'' = { | MyRow }

type MyRecord2 = Record ( banana :: Unit | MyRow )

type MyRecord2' = { banana :: Unit | MyRow }

-- depends on how much work you want to do:
{-- type Extensible r = ( banana :: Unit | r ) --}
type Extensible (r :: # Type) = ( banana :: Unit | r )

type MyExtended = Extensible MyRow

{-- type MyExtensibleError = Extensible MyRecord --}
-- Could not match kind
--
--   # Type
--
-- with kind
--
--   Type
--
-- while checking the kind of
--
--   Extensible MyRecord
--
-- in type synonym
--
--   MyExtensibleError

main :: Effect Unit
main = do
  log "Hello sailor!"
