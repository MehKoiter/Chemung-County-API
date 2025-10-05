# Contributing to Chemung County Politics API

Thank you for your interest in contributing to the Chemung County Politics API! This project aims to strengthen democracy through better access to local political information, and we welcome contributions from developers, civic organizations, data enthusiasts, and community members.

## 🤝 Ways to Contribute

### 1. Code Contributions
- Bug fixes and performance improvements
- New API features and endpoints
- Documentation improvements
- Test coverage enhancements
- Security improvements

### 2. Data Contributions
- Candidate information and biographical data
- Election results and historical data
- Polling location updates
- Campaign finance information
- Verification of existing data

### 3. Community Contributions
- User experience feedback
- Feature requests and suggestions
- Bug reports and testing
- Documentation and tutorials
- Outreach to local organizations

## 🛠️ Development Workflow

### Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/Chemung-County-API.git
   cd Chemung-County-API
   ```
3. **Set up development environment**:
   ```bash
   npm install
   cp .env.example .env
   # Edit .env with your configuration
   npm run db:setup
   ```
4. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Development Standards

#### Code Style
- Follow ESLint configuration (run `npm run lint`)
- Use Prettier for code formatting (run `npm run lint:fix`)
- Write meaningful commit messages following [Conventional Commits](https://www.conventionalcommits.org/)

#### Testing
- Write tests for new features and bug fixes
- Maintain minimum 80% code coverage
- Run tests before submitting: `npm test`
- Include both unit and integration tests where appropriate

#### Documentation
- Update API documentation for new endpoints
- Include JSDoc comments for new functions
- Update README if adding major features
- Add examples for new functionality

### Submitting Changes

1. **Ensure your code follows our standards**:
   ```bash
   npm run lint
   npm test
   npm run test:coverage
   ```

2. **Commit your changes**:
   ```bash
   git add .
   git commit -m "feat: add candidate search endpoint"
   ```

3. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

4. **Create a Pull Request** on GitHub with:
   - Clear description of changes
   - Reference to related issues
   - Screenshots for UI changes
   - Test results and coverage reports

## 📊 Data Contribution Guidelines

### Data Quality Standards
- **Accuracy**: All data must be verifiable from reliable sources
- **Completeness**: Provide as much relevant information as possible
- **Timeliness**: Keep information current and updated
- **Attribution**: Always cite sources for contributed data

### Data Sources Priority
1. **Official Government Sources**: Board of Elections, government websites
2. **Candidate Official Sources**: Campaign websites, official statements
3. **Verified News Sources**: Local newspapers, broadcast media
4. **Community Verification**: Multiple independent confirmations

### Data Submission Process
1. Use the data contribution API endpoints (when available)
2. Include source citations and verification method
3. Follow the established data schema
4. Submit through pull request with data files
5. Participate in community review process

## 🐛 Bug Reports

When reporting bugs, please include:

- **Clear description** of the issue
- **Steps to reproduce** the problem
- **Expected vs actual behavior**
- **Environment details** (OS, Node version, etc.)
- **Error messages** and logs if applicable
- **Screenshots** for UI issues

Use our [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md) for consistency.

## 💡 Feature Requests

Before submitting feature requests:

1. **Check existing issues** to avoid duplicates
2. **Discuss in GitHub Discussions** for community input
3. **Consider the project scope** and mission
4. **Provide clear use cases** and benefits

Use our [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md).

## 📋 Code of Conduct

### Our Pledge

We are committed to making participation in this project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Expected Behavior

- **Be respectful** and inclusive in language and actions
- **Accept constructive criticism** gracefully
- **Focus on community benefit** over individual preferences
- **Show empathy** towards other community members
- **Respect diverse perspectives** on political and technical matters

### Unacceptable Behavior

- Harassment, trolling, or discriminatory language
- Personal attacks or political arguments unrelated to the project
- Publishing private information without permission
- Any conduct that could reasonably be considered inappropriate

### Enforcement

Instances of unacceptable behavior may be reported to the project maintainers. All reports will be reviewed and investigated promptly and fairly.

## 🏛️ Political Neutrality

This project maintains strict political neutrality:

- **No partisan endorsements** or political advocacy
- **Equal treatment** of all candidates and parties
- **Factual information only** - no editorial content
- **Transparent data sources** and methodologies
- **Community-driven verification** processes

## 📞 Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and community discussion
- **Pull Requests**: Code and documentation contributions
- **Email**: [contact@chemung-politics-api.org] for sensitive issues

## 🏆 Recognition

Contributors will be recognized in:
- Project README acknowledgments
- Annual contributor reports
- Community showcases and presentations
- Optional contributor profiles (with permission)

## 📚 Additional Resources

- [Development Setup Guide](./docs/development-setup.md)
- [API Documentation](./docs/api-schema-standards.md)
- [Project Roadmap](./docs/phased-release-plan.md)
- [Data Sources Guide](./docs/chemung-county-data-sources.md)

## ❓ Questions?

If you have questions about contributing, please:
1. Check the documentation first
2. Search existing GitHub issues and discussions
3. Ask in GitHub Discussions for community help
4. Contact maintainers for sensitive or complex issues

Thank you for helping make local political information more accessible to everyone! 🗳️✨