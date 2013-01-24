##
# Do action :
#
#  Placez un denier de la réserve sur 1 ou #{num} cartes Evénement différentes. Les
#  autres joueurs subissent l’effet de ces événements autant de fois qu’il y a
#  de deniers posés sur la carte. Les joueurs peuvent construire des remparts
#  pour se protéger. S’il s’agit d’un événement positif, tous les joueurs visés
#  par la carte Evénement en profitent, y compris vous. La baliste permet
#  d’activer une carte Evénement sur laquelle il n’est plus possible de rajouter
#  de denier. Dans ce cas, activez l’événement au maximum.
#
class Actions::PutDenierOnEvent < Action

  field :num, :type => Integer

end
