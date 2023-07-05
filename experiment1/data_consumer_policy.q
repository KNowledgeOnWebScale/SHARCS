@prefix : <urn:odrl-compiler:> .
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix odrl: <http://www.w3.org/ns/odrl/2/> .
@prefix odrlp: <http://example.org/odrl:profile:01/> .

(_:P _:O) log:onQuestionSurface {
   :Result _:P _:O .
   () log:onAnswerSurface {
      :Result _:P _:O .
   }
} .

(_:P _:O _:P2 _:O2) log:onQuestionSurface {
   :Result :constraint _:O .
   _:O _:P2 _:O2 .
   () log:onAnswerSurface {
      _:O _:P2 _:O2 .
   }
} .

(_:Scope) log:onQuestionSurface {
   _:Scope log:notIncludes {
      :Result odrl:action odrlp:grantAccess.
   } .
   () log:onAnswerSurface {
      () log:onNegativeSurface {
         :Result odrl:action odrlp:grantAccess.
      } .
   } .
} .