const explorePublications = '''
query {
  explorePublications(request: {
  sortCriteria: LATEST,
  publicationTypes: [POST, COMMENT, MIRROR],
  limit: 50
  }) {
    items {
      __typename
      ... on Post {
      ...PostFields
      }
    }
  }
}

fragment ProfileFields on Profile {
  id
  name
  bio
  attributes {
    displayType
    traitType
    key
    value
  }
  metadata
  isDefault
  handle
  picture {
    ... on NftImage {
      contractAddress
      tokenId
      uri
      verified
    }
    ... on MediaSet {
      original {
      ...MediaFields
      }
      small {
      ...MediaFields
      }
      medium {
      ...MediaFields
      }
    }
  }
  coverPicture {
  ... on NftImage {
    contractAddress
    tokenId
    uri
    verified
    }
    ... on MediaSet {
      original {
        ...MediaFields
      }
      small {
        ...MediaFields
      }
      medium {
        ...MediaFields
      }
    }
  }
  ownedBy
  dispatcher {
    address
  }
  stats {
    totalFollowers
    totalFollowing
    totalPosts
    totalComments
    totalMirrors
    totalPublications
    totalCollects
  }
  followModule {
    ... on FeeFollowModuleSettings {
    type
    amount {
      asset {
        name
        symbol
        decimals
        address
      }
      value
    }
    recipient
  }
  ... on ProfileFollowModuleSettings {
    type
  }
  ... on RevertFollowModuleSettings {
    type
  }
  }
}

fragment MediaFields on Media {
  url
  width
  height
  mimeType
}

fragment PublicationStatsFields on PublicationStats {
  totalAmountOfMirrors
  totalAmountOfCollects
  totalAmountOfComments
}

fragment MetadataOutputFields on MetadataOutput {
  name
  description
  content
  media {
    original {
      ...MediaFields
    }
    small {
      ...MediaFields
    }
    medium {
      ...MediaFields
    }
  }
  attributes {
    displayType
    traitType
    value
  }
}

fragment PostFields on Post {
  id
  profile {
    ...ProfileFields
  }
  stats {
    ...PublicationStatsFields
  }
  metadata {
    ...MetadataOutputFields
  }
  createdAt
  appId
}''';

String createPostTypedData(dynamic request) => '''
{
createPostTypedData(request: $request) {
id
expiresAt
typedData {
types {
PostWithSig {
name
type
}
}
domain {
name
chainId
version
verifyingContract
}
value {
nonce
deadline
profileId
contentURI
collectModule
collectModuleInitData
referenceModule
referenceModuleInitData
}
}
}
}
''';

String authentication(dynamic request) =>  '''
{
authenticate(request: $request) {
accessToken
refreshToken
}
}
''';

const fetchJobsQuery = '''
query {
  PublicationsQueryRequest(request: {
  sortCriteria: LATEST,
  profileId: "0x09df",
  publicationTypes: [POST],
  limit: 50
  }) {
    items {
      __typename
      ... on Post {
      ...PostFields
      }
    }
  }
}

fragment ProfileFields on Profile {
  id
  name
  bio
  attributes {
    displayType
    traitType
    key
    value
  }
  metadata
  isDefault
  handle
  picture {
    ... on NftImage {
      contractAddress
      tokenId
      uri
      verified
    }
    ... on MediaSet {
      original {
      ...MediaFields
      }
      small {
      ...MediaFields
      }
      medium {
      ...MediaFields
      }
    }
  }
  coverPicture {
  ... on NftImage {
    contractAddress
    tokenId
    uri
    verified
    }
    ... on MediaSet {
      original {
        ...MediaFields
      }
      small {
        ...MediaFields
      }
      medium {
        ...MediaFields
      }
    }
  }
  ownedBy
  dispatcher {
    address
  }
  stats {
    totalFollowers
    totalFollowing
    totalPosts
    totalComments
    totalMirrors
    totalPublications
    totalCollects
  }
  followModule {
    ... on FeeFollowModuleSettings {
    type
    amount {
      asset {
        name
        symbol
        decimals
        address
      }
      value
    }
    recipient
  }
  ... on ProfileFollowModuleSettings {
    type
  }
  ... on RevertFollowModuleSettings {
    type
  }
  }
}

fragment MediaFields on Media {
  url
  width
  height
  mimeType
}

fragment PublicationStatsFields on PublicationStats {
  totalAmountOfMirrors
  totalAmountOfCollects
  totalAmountOfComments
}

fragment MetadataOutputFields on MetadataOutput {
  name
  description
  content
  media {
    original {
      ...MediaFields
    }
    small {
      ...MediaFields
    }
    medium {
      ...MediaFields
    }
  }
  attributes {
    displayType
    traitType
    value
  }
}

fragment PostFields on Post {
  id
  profile {
    ...ProfileFields
  }
  stats {
    ...PublicationStatsFields
  }
  metadata {
    ...MetadataOutputFields
  }
  createdAt
  appId
}''';

const GET_PUBLICATIONS = '''{
publications(request: {
profileId: "0x3a77",
publicationTypes: [POST],
}) {
items {
__typename
... on Post {
...PostFields
}
... on Comment {
...CommentFields
}
... on Mirror {
...MirrorFields
}
}
pageInfo {
prev
next
totalCount
}
}
}

fragment MediaFields on Media {
url
mimeType
}

fragment ProfileFields on Profile {
id
name
bio
attributes {
displayType
traitType
key
value
}
metadata
isDefault
handle
picture {
... on NftImage {
contractAddress
tokenId
uri
verified
}
... on MediaSet {
original {
...MediaFields
}
}
}
coverPicture {
... on NftImage {
contractAddress
tokenId
uri
verified
}
... on MediaSet {
original {
...MediaFields
}
}
}
ownedBy
dispatcher {
address
}
stats {
totalFollowers
totalFollowing
totalPosts
totalComments
totalMirrors
totalPublications
totalCollects
}
followModule {
... on FeeFollowModuleSettings {
type
amount {
asset {
name
symbol
decimals
address
}
value
}
recipient
}
... on ProfileFollowModuleSettings {
type
}
... on RevertFollowModuleSettings {
type
}
}
}

fragment PublicationStatsFields on PublicationStats {
totalAmountOfMirrors
totalAmountOfCollects
totalAmountOfComments
}

fragment MetadataOutputFields on MetadataOutput {
name
description
content
media {
original {
...MediaFields
}
}
attributes {
displayType
traitType
value
}
}

fragment Erc20Fields on Erc20 {
name
symbol
decimals
address
}

fragment CollectModuleFields on CollectModule {
__typename
... on FreeCollectModuleSettings {
type
followerOnly
contractAddress
}
... on FeeCollectModuleSettings {
type
amount {
asset {
...Erc20Fields
}
value
}
recipient
referralFee
}
... on LimitedFeeCollectModuleSettings {
type
collectLimit
amount {
asset {
...Erc20Fields
}
value
}
recipient
referralFee
}
... on LimitedTimedFeeCollectModuleSettings {
type
collectLimit
amount {
asset {
...Erc20Fields
}
value
}
recipient
referralFee
endTimestamp
}
... on RevertCollectModuleSettings {
type
}
... on TimedFeeCollectModuleSettings {
type
amount {
asset {
...Erc20Fields
}
value
}
recipient
referralFee
endTimestamp
}
}

fragment PostFields on Post {
id
profile {
...ProfileFields
}
stats {
...PublicationStatsFields
}
metadata {
...MetadataOutputFields
}
createdAt
collectModule {
...CollectModuleFields
}
referenceModule {
... on FollowOnlyReferenceModuleSettings {
type
}
}
appId
}

fragment MirrorBaseFields on Mirror {
id
profile {
...ProfileFields
}
stats {
...PublicationStatsFields
}
metadata {
...MetadataOutputFields
}
createdAt
collectModule {
...CollectModuleFields
}
referenceModule {
... on FollowOnlyReferenceModuleSettings {
type
}
}
appId
}

fragment MirrorFields on Mirror {
...MirrorBaseFields
mirrorOf {
... on Post {
...PostFields
}
... on Comment {
...CommentFields
}
}
}

fragment CommentBaseFields on Comment {
id
profile {
...ProfileFields
}
stats {
...PublicationStatsFields
}
metadata {
...MetadataOutputFields
}
createdAt
collectModule {
...CollectModuleFields
}
referenceModule {
... on FollowOnlyReferenceModuleSettings {
type
}
}
appId
}

fragment CommentFields on Comment {
...CommentBaseFields
mainPost {
... on Post {
...PostFields
}
... on Mirror {
...MirrorBaseFields
mirrorOf {
... on Post {
...PostFields
}
... on Comment {
...CommentMirrorOfFields
}
}
}
}
}

fragment CommentMirrorOfFields on Comment {
...CommentBaseFields
mainPost {
... on Post {
...PostFields
}
... on Mirror {
...MirrorBaseFields
}
}
}
''';