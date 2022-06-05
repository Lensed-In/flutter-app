const explorePublications = '''
query {
  explorePublications(request: {
  sortCriteria: TOP_COMMENTED,
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
