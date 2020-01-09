require 'rspec'
require 'simplecov'
require 'faker'

require 'stp'

STP.config do |c|
  c.api_uri = 'xxxxx'
  c.private_key = %q(
  -----BEGIN RSA PRIVATE KEY-----
  MIICXgIBAAKBgQDO6dcS4k8Sz//09ISLLCIqHjCYNpHUbtauyu4+N3bvTOxgyX9R
  fC9hQ0HyL6VjcAoY67BNF1gvLPTRB0ijwMPpl2uEyv2y1pPwxmDoH4dH0aoRrWUW
  zSejnfVn4NoHIchiu8umIofDFuGb/cIDnVBikKNFBTf6HxPePUW2p35Q9wIDAQAB
  AoGBAJm4jqmf6mEumJkyw/nlauhhj3a2K/dn9STc7MzaRgkY3BA4AtfV7BlVb3vv
  O+85QLcs+sj7S++YdbWJtMS7pI/jYQPEiR2pQ9aHx/Hacor92Oi7zEzn6QLr/VKA
  K2qPAiRicPItrY4zWkrEwmwX0SBUPjAD3Ffjf8T6cETE8puxAkEA7aijTnkK8FzM
  TxXDl6UMxSwjcJeP/vJcN+im+aphliIGJykL1kcXT5B9R3OUyqsbySgmjsG2yNEm
  psCEd/rZKQJBAN7hxnVGAeVl1q2NWgL+lCgvgwaoPqE2NzcFsIxs5EOpKXn0fZuR
  oH7l09Giv61NmdNAJT1oMxdLVQ9QJ1UNfR8CQQC9ACr3Yk2vv6z/i+hjte/E8ogw
  p2ftsaJjGBOKY9R9yAsqo3r1as4ACYGIDEQdNRzAybx4NVf+tk5NuLbgj86ZAkEA
  h3BpmgA1zMHK5+H6rdEoFRdyJsx8api4it4RP/Q37gnQ44Q4BB5Find89WpR0i1S
  6bWUK7GzQleL0+dgT2YH/wJAByKN5rEvP/XLiwSu68lQtloDAJxQfD4CSHlC97Mw
  9bIAmsKrvYVL4B40Nb3jPNXCKm8zRqFu//WX/G1uy5Q6nQ==
  -----END RSA PRIVATE KEY-----
  )
  c.private_key_password = '12345678'
  c.company = 'xxxxx'
end

SimpleCov.start
