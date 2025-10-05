# API Schema and Standards

This document defines the data models, API structure, and technical standards for the Chemung County Politics API.

## Design Principles

1. **VIP Compatibility**: Follow Voting Information Project standards where possible
2. **RESTful Design**: Clear, predictable endpoints using HTTP best practices
3. **Extensible Schema**: Support for additional data fields and future enhancements
4. **Community Driven**: Enable crowdsourced data with verification workflows
5. **Integration Ready**: Easy to consume by mobile apps and websites

## Core Data Models

### 1. Election

```json
{
  "id": "string",
  "name": "string",
  "date": "date",
  "type": "string", // "general", "primary", "special", "municipal"
  "level": "string", // "federal", "state", "county", "municipal", "school"
  "status": "string", // "upcoming", "active", "completed"
  "registration_deadline": "date",
  "early_voting_start": "date",
  "early_voting_end": "date",
  "absentee_deadline": "date",
  "description": "string",
  "jurisdiction": {
    "id": "string",
    "name": "string",
    "type": "string" // "county", "city", "town", "village", "district"
  },
  "contests": ["contest_id"],
  "polling_locations": ["location_id"],
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

### 2. Contest (Race)

```json
{
  "id": "string",
  "election_id": "string",
  "name": "string",
  "office": {
    "id": "string",
    "name": "string",
    "level": "string", // "federal", "state", "county", "municipal"
    "district": "string",
    "term_length": "integer", // years
    "is_partisan": "boolean"
  },
  "type": "string", // "candidate", "ballot_measure"
  "number_to_elect": "integer",
  "candidates": ["candidate_id"],
  "ballot_measures": ["measure_id"],
  "voting_districts": ["district_id"],
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

### 3. Candidate

```json
{
  "id": "string",
  "name": {
    "first": "string",
    "middle": "string",
    "last": "string",
    "suffix": "string",
    "display": "string"
  },
  "party": {
    "id": "string",
    "name": "string",
    "abbreviation": "string"
  },
  "biographical": {
    "age": "integer",
    "occupation": "string",
    "education": "string",
    "experience": "string",
    "residence": {
      "city": "string",
      "county": "string",
      "state": "string"
    }
  },
  "contact": {
    "website": "string",
    "email": "string",
    "phone": "string",
    "facebook": "string",
    "twitter": "string",
    "instagram": "string"
  },
  "positions": [
    {
      "issue": "string",
      "stance": "string",
      "source": "string",
      "date": "date"
    }
  ],
  "endorsements": [
    {
      "organization": "string",
      "date": "date",
      "source": "string"
    }
  ],
  "campaign_finance": {
    "total_raised": "decimal",
    "total_spent": "decimal",
    "cash_on_hand": "decimal",
    "last_updated": "date",
    "filing_url": "string"
  },
  "elections": ["election_id"],
  "photo_url": "string",
  "incumbent": "boolean",
  "created_at": "datetime",
  "updated_at": "datetime",
  "verified": "boolean",
  "verification_source": "string"
}
```

### 4. Office Holder

```json
{
  "id": "string",
  "candidate_id": "string",
  "office": {
    "id": "string",
    "name": "string",
    "level": "string",
    "district": "string"
  },
  "term": {
    "start_date": "date",
    "end_date": "date",
    "elected_date": "date"
  },
  "voting_record": [
    {
      "vote_id": "string",
      "bill_title": "string",
      "vote": "string", // "yes", "no", "abstain", "absent"
      "date": "date",
      "description": "string"
    }
  ],
  "committee_memberships": [
    {
      "committee_name": "string",
      "role": "string", // "chair", "vice-chair", "member"
      "start_date": "date",
      "end_date": "date"
    }
  ],
  "contact_info": {
    "office_address": "string",
    "office_phone": "string",
    "office_email": "string",
    "office_hours": "string"
  },
  "active": "boolean",
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

### 5. Ballot Measure

```json
{
  "id": "string",
  "election_id": "string",
  "title": "string",
  "summary": "string",
  "full_text": "string",
  "type": "string", // "proposition", "referendum", "initiative", "bond"
  "jurisdiction": {
    "id": "string",
    "name": "string",
    "type": "string"
  },
  "fiscal_impact": {
    "summary": "string",
    "amount": "decimal",
    "duration": "string"
  },
  "arguments": {
    "for": "string",
    "against": "string",
    "for_sources": ["string"],
    "against_sources": ["string"]
  },
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

### 6. Polling Location

```json
{
  "id": "string",
  "name": "string",
  "address": {
    "street": "string",
    "city": "string",
    "state": "string",
    "zip": "string",
    "county": "string"
  },
  "coordinates": {
    "latitude": "decimal",
    "longitude": "decimal"
  },
  "accessibility": {
    "wheelchair_accessible": "boolean",
    "parking_available": "boolean",
    "public_transit": "boolean",
    "notes": "string"
  },
  "hours": {
    "election_day": {
      "open": "time",
      "close": "time"
    },
    "early_voting": [
      {
        "date": "date",
        "open": "time",
        "close": "time"
      }
    ]
  },
  "districts": ["district_id"],
  "elections": ["election_id"],
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

### 7. Voting District

```json
{
  "id": "string",
  "name": "string",
  "type": "string", // "congressional", "assembly", "senate", "county", "town", "city", "school"
  "number": "string",
  "boundaries": {
    "geojson": "object", // GeoJSON geometry
    "description": "string"
  },
  "population": "integer",
  "registered_voters": "integer",
  "polling_locations": ["location_id"],
  "parent_district": "string", // for nested districts
  "child_districts": ["district_id"],
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

## API Endpoints

### Elections
- `GET /api/v1/elections` - List elections
- `GET /api/v1/elections/{id}` - Get election details
- `GET /api/v1/elections/upcoming` - Get upcoming elections
- `GET /api/v1/elections/by-address` - Get elections by voter address

### Candidates
- `GET /api/v1/candidates` - List candidates
- `GET /api/v1/candidates/{id}` - Get candidate details
- `GET /api/v1/candidates/by-election/{election_id}` - Get candidates for election
- `POST /api/v1/candidates` - Submit candidate information (authenticated)

### Office Holders
- `GET /api/v1/officials` - List current officials
- `GET /api/v1/officials/{id}` - Get official details
- `GET /api/v1/officials/by-address` - Get officials by address
- `GET /api/v1/officials/by-office` - Get officials by office type

### Polling Locations
- `GET /api/v1/polling-locations` - List polling locations
- `GET /api/v1/polling-locations/by-address` - Get polling location by address
- `GET /api/v1/polling-locations/{id}` - Get location details

### Districts
- `GET /api/v1/districts` - List districts
- `GET /api/v1/districts/{id}` - Get district details
- `GET /api/v1/districts/by-address` - Get districts by address

### Ballot Measures
- `GET /api/v1/ballot-measures` - List ballot measures
- `GET /api/v1/ballot-measures/{id}` - Get measure details
- `GET /api/v1/ballot-measures/by-election/{election_id}` - Get measures for election

## Authentication and Authorization

### API Key Tiers
1. **Public** (no auth required):
   - Read-only access to basic election information
   - Rate limit: 1000 requests/hour

2. **Registered** (API key required):
   - Full read access to all data
   - Rate limit: 10,000 requests/hour
   - Access to detailed candidate information

3. **Contributor** (API key + verification):
   - Write access for data contributions
   - Data submission and updates
   - Rate limit: 25,000 requests/hour

4. **Partner** (special agreement):
   - Bulk data access
   - Real-time webhook notifications
   - Custom rate limits

### Authentication Methods
- **API Key**: Header-based authentication
- **OAuth 2.0**: For user-facing applications
- **JWT Tokens**: For session-based access

## Data Quality and Verification

### Verification Levels
1. **Unverified**: Community-submitted data
2. **Community Verified**: Confirmed by multiple sources
3. **Official**: From government sources
4. **Certified**: Verified by election officials

### Data Sources Tracking
- All data includes source attribution
- Audit trail for data changes
- Confidence scores for aggregated data

## Technical Standards

### Data Formats
- **Primary**: JSON
- **Export Options**: CSV, XML (VIP format), JSON-LD
- **Character Encoding**: UTF-8

### API Versioning
- URL versioning (e.g., `/api/v1/`)
- Semantic versioning for releases
- Deprecation notices with migration timeline

### Error Handling
```json
{
  "error": {
    "code": "string",
    "message": "string",
    "details": "object",
    "timestamp": "datetime"
  }
}
```

### Pagination
```json
{
  "data": "array",
  "pagination": {
    "page": "integer",
    "per_page": "integer",
    "total": "integer",
    "total_pages": "integer",
    "next_page": "string|null",
    "prev_page": "string|null"
  }
}
```

## Integration Standards

### VIP Feed Generation
- Automated VIP XML export for election data
- Compatibility with Google Civic Information API
- Integration with Ballotpedia data submission

### Webhook Support
- Real-time notifications for data updates
- Event types: election_created, candidate_updated, result_posted
- Retry logic for failed deliveries

### Widget/Embed Support
- JavaScript widgets for websites
- Iframe embeds for basic functionality
- Customizable styling and branding

## Performance and Scalability

### Caching Strategy
- Redis for frequently accessed data
- CDN for static resources
- Database query optimization

### Rate Limiting
- Token bucket algorithm
- Per-endpoint limits
- Graceful degradation under load

### Monitoring
- API response time tracking
- Error rate monitoring
- Usage analytics and reporting